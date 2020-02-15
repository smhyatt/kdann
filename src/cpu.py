import cv2
import numpy
from sklearn.feature_extraction import image
from sklearn.decomposition import PCA
from sklearn.neighbors import NearestNeighbors
import cProfile
import pyopencl
import pyopencl.array as pycl_array
import time
import brute

from util import build_kd_tree, brute_force, traverse_tree, propagate_patches
numpy.random.seed(seed=0)

psize = 8
n_channels = 3
pca_dim = 8
k_neighbours = 1


try:
    platform_id = 0
    platforms = pyopencl.get_platforms()
    devices = platforms[platform_id].get_devices()

except Exception as e:
    raise Exception("Could not access device '{}' on platform with '{}': {}".format(str(platform_id), str(device_id), str(e)))

device_id = 0
device = devices[device_id]
ctx = pyopencl.Context(devices=[device])
queue = pyopencl.CommandQueue(ctx)
futobj = brute.brute(command_queue=queue)



def run():

    # load both images
    image_a = cv2.imread("../data/A.jpg")
    image_b = cv2.imread("../data/B.jpg")
    print(f"Shape of image A: {image_a.shape}")
    print(f"Shape of image B: {image_b.shape}")

    # create patches
    patches_a = image.extract_patches_2d(image_a, (psize,psize))
    patches_b = image.extract_patches_2d(image_b, (psize,psize))
    print(f"Patches created for image A: {patches_a.shape}")
    print(f"Patches created for image B: {patches_b.shape}")
    # for pa in patches_a:
    #     print(f"Patches for image A: {pa}")
    patches_a = patches_a.reshape((-1,psize*psize*n_channels))
    patches_b = patches_b.reshape((-1,psize*psize*n_channels))


    # for pb in patches_b:
    #     print(f"Patches for image B: {pb}")

    # random subset (1000 instances from each image)
    patches_a_subset = patches_a[numpy.random.choice(patches_a.shape[0], 1000, replace=False)]
    patches_b_subset = patches_b[numpy.random.choice(patches_b.shape[0], 1000, replace=False)]
    print(f"Subset of patches created for image A: {patches_a_subset.shape}")
    print(f"Subset of patches created for image B: {patches_b_subset.shape}")

    # compute PCA model (FAST ALREADY)
    model = PCA(n_components=pca_dim)
    # rat = model.explained_variance_ratio_
    # print(f"The variance ratio for applying PCA: {rat}")
    both_subsets = numpy.concatenate((patches_a_subset, patches_b_subset), axis=0)
    model.fit(both_subsets)

    # apply PCA model
    patches_a_reduced = model.transform(patches_a)
    patches_b_reduced = model.transform(patches_b)
    print(f"Patches reduced for image A: {patches_a_reduced.shape}")
    print(f"Patches reduced for image B: {patches_b_reduced.shape}")

    # for par in patches_a_reduced:
    #     print(f"Patches reduced for image A data: {par}")

    patches_a_reduced_cl = pycl_array.to_device(queue, patches_a_reduced)
    patches_b_reduced_cl = pycl_array.to_device(queue, patches_b_reduced)

    start_time = time.time()
    
    futbrute = futobj.main(patches_a_reduced_cl, patches_b_reduced_cl)
    
    total_time = time.time() - start_time
    total_time = float("{0:.3f}".format(total_time))
    print("Total time to run Futbrute: {0} seconds.".format(total_time))
    
    # for par in futbrute:
    #     print(f"Futbrute output: {par}") 


    # BASELINE (NOT OPTIMIZED)
    # compute k-d tree
    tree_sklearn = NearestNeighbors(n_neighbors=1, algorithm='kd_tree', n_jobs=6).fit(patches_b_reduced)
    print("K-d tree has been fitted ...")

    # The baseline reports around 57 L2 on pca 3, 27 on pca 8
    print("Traversing sklearn")
    distances, indices = tree_sklearn.kneighbors(patches_a_reduced)
    indices = indices.flatten()

    # BASELINE: Propagated k-d trees (not available)
    # TODO


    ############################################################
    # propagated version
    indices_custom = numpy.zeros((patches_a_reduced.shape[0], k_neighbours), dtype=int)

    # build modified tree
    print("Building propagated k-d tree version ...")
    tree_depth, leaves, inverse_lookup, split_values, split_dimensions = build_kd_tree(patches_b_reduced, max_leaf_size=50)
    print(f"Depth: {tree_depth}")
    print("Propagation starts ...")

    # k-d tree traversal is written as a double loop here for hopefully easy translation to gpu
    # query k-d tree & propagation
    # traverse each row; the idea is to "propagate" information from row i to row i+1
    n_cols = image_a.shape[0]-psize+1
    n_rows = image_a.shape[1]-psize+1

    for patch_y in range(n_rows):

        # print(f"Processing row {patch_y} of {n_rows} ...")

        # this could be done in parallel (?)
        # TODO: Do this in parallel, and then parallelize the brute force only
        # - for the first row, we simply use the K nearest neighbors/indices found by sklearn/bufferkdtree
        # - for the other rows, we only report the leaf indices to be checked
        # - GPU: parallel brute-force
        for patch_x in range(n_cols):

            patch_index = n_cols*patch_y + patch_x
            patch = patches_a_reduced[patch_index]

            # traverse tree (go to bottom)
            # TODO: neighbour_array = [ (dist, indices), float32 ]
            best_neighbours = None

            best_neighbours = traverse_tree(patch, patch_y<1, tree_depth, 0, best_neighbours, leaves, split_values, split_dimensions, k_neighbours)
            propagate_patches(best_neighbours, patch_x, patch_y, n_cols, indices_custom, inverse_lookup, patch, leaves, k_neighbours)

            indices_custom[patch_index] = best_neighbours[1]

    # comparison of results


    #print(f"Custom nearest patches found: {indices_custom.shape}")
    #print(f"Nearest patches found: {indices.shape}")

    # compute score
    patches_a_reconstructed_custom = patches_b[indices_custom[:, 0], :]
    #patches_a_reconstructed = patches_b[indices, :]

    diff_custom = patches_a.astype(numpy.float32) - patches_a_reconstructed_custom.astype(numpy.float32)
    l2_custom = numpy.mean(numpy.linalg.norm(diff_custom, axis=1))
    print(f"L2_custom: {l2_custom}")

    #diff = patches_a.astype(numpy.float32) - patches_a_reconstructed.astype(numpy.float32)
    #l2 = numpy.mean(numpy.linalg.norm(diff, axis=1))
    #print(f"L2: {l2}")

# cProfile.run('run()')
run()
