import numpy
numpy.random.seed(seed=0)

def select_split_dimension(points, max_rows=100):
    """ This functions compute the axis/dimension
    with the "widest spread" for the given array
    of points.
    """

    # sample just random X rows for fast tree building
    if ((max_rows > 0) and (points.shape[0] < max_rows)):
        row_indices = numpy.random.randint(points.shape[0], size=max_rows)
        points = points[row_indices, :]

    best_difference = 0
    best_split = 0

    # TODO:
    # - Numpy to compute differences
    # - Numpy to compute the max of differences (argmax)

    # iterate over all dimensions
    for i in range(points.shape[1]):

        # compute the difference between the max and min w.r.t. dimension i
        difference = numpy.max(points[:, i]) - numpy.min(points[:, i])

        # update difference and best dimension if needed
        if difference >= best_difference:

            best_difference = difference
            best_split = i

    return best_split


# Makes the KD-Tree for fast lookup
def build_kd_tree(patches, max_depth=-1, max_leaf_size=50):
    """
    Create 'empty' lists to contain the k-d tree
     split_values: values of split nodes
     split_dimensions: dimension of split nodes
     leaves: list of leaves
     inverse_lookup: per patch, pointer to leaf (int)
    """

    # (1) select max_depth
    if max_depth < 1: # x < y < z is equivalent to x < y and y < z, and is evaluates from left-to-right.
        assert(len(patches) > max_leaf_size > 1)
        max_depth = int(numpy.log2(len(patches)/max_leaf_size)) + 1 
    else:
        assert(len(patches) > (2 ** (max_depth - 1)))
    print(f"Going for a depth of: {max_depth}")

    # (2) initialize the internal nodes of the k-d tree
    # we assume that we have perfectly balanced trees (i.e, that we stop at a leaf size > 1)
    split_values = numpy.zeros((2 ** max_depth) - 1, dtype=numpy.float32)
    split_dimensions = numpy.zeros((2 ** max_depth) - 1, dtype=numpy.int32)

    # (3) initialize the leaves of the k-d tree
    # - list of Numpy arrays containing the points
    # - inverse loop-up for points (point -> leaf index)
    leaves = [None] * (2 ** (max_depth - 1))
    inverse_lookup = numpy.zeros(patches.shape[0], dtype=numpy.int32)

    # (4) create copy of the original patch indices (which are processed
    # in the same way as the points)
    indices_template = numpy.arange(patches.shape[0])
    print("Patches shape[0] length:", patches.shape[0])

    # (5) build k-d tree recursively
    make_kd_tree_recursive(patches, indices_template, 0, max_depth, 0, leaves, inverse_lookup, split_values, split_dimensions)

    return max_depth, leaves, inverse_lookup, split_values, split_dimensions

# points = patches, 
def make_kd_tree_recursive(points, indices, depth, max_depth, index, leaves, inverse_lookup, split_values, split_dimensions):

    for pa in range(10):
        print("Patch as point:", points[pa])

    # if depth not reached: create internal node
    if depth < max_depth - 1:

        # (1) select dimension to split on
        dim = select_split_dimension(points)

        # (2) sort points and indices w.r.t. dimension dim
        # (find median of the points w.r.t. dimension dim)
        sort_indices = points[:, dim].argsort()
        indices = indices[sort_indices]
        points = points[sort_indices]
        median_idx = (points.shape[0]) // 2

        print("Median idx:", median_idx)

        for d in range(10):
            print("Points after sort:", points[d])
            


        # (3) the split value used
        split_value = points[median_idx][dim]

        # (4) store information in internal node (index is the index of the internal node)
        split_values[index] = split_value
        split_dimensions[index] = dim

        # (5) recursive calls
        make_kd_tree_recursive(points[: median_idx], indices[: median_idx], depth + 1, max_depth, (index+1)*2-1, leaves, inverse_lookup, split_values, split_dimensions)
        make_kd_tree_recursive(points[median_idx:], indices[median_idx:], depth + 1, max_depth, (index+1)*2, leaves, inverse_lookup, split_values, split_dimensions)

    # create a leaf
    else:

        leaf_index = index + 1 - (2 ** (max_depth - 1))
        leaves[leaf_index] = [points, indices]

        # store inverse lookup indices
        for i in indices:
            inverse_lookup[i] = leaf_index

def traverse_tree(query_patch, backtrack, tree_depth, node_index, best_neighbours, leaves, split_values, split_dimensions, k_neighbours, alpha=1.0):

    # if we have reached a leaf (here, (2 ** (tree_depth - 1)) - 1 corresponds to the max internal node index)
    if node_index >= (2 ** (tree_depth - 1)) - 1:

        # do not continue
        # print(node[3], node_index + 1 - (2 ** (tree_depth - 1)))
        best_neighbours = brute_force(query_patch, node_index + 1 - (2 ** (tree_depth - 1)), leaves, best_neighbours, k_neighbours)

        return best_neighbours

    # else: go left
    if query_patch[split_dimensions[node_index]] <= split_values[node_index]:
        # Go down one, append the other for backtracking
        first = (node_index+1)*2-1
        second = (node_index+1)*2

    # or go right
    else:
        # Go down one, append the other for backtracking
        first = (node_index+1)*2
        second = (node_index+1)*2-1

    # handle "first" node (just go down)
    best_neighbours = traverse_tree(query_patch, backtrack, tree_depth, first, best_neighbours, leaves, split_values, split_dimensions, k_neighbours)

    # if backtracking is active, traverse also the "second" node
    if backtrack:
        if abs(split_values[node_index] - query_patch[split_dimensions[node_index]]) < (best_neighbours[0][-1] / alpha):
            best_neighbours = traverse_tree(query_patch, backtrack, tree_depth, second, best_neighbours, leaves, split_values, split_dimensions, k_neighbours)

    return best_neighbours

def propagate_patches(best_neighbours, patch_x, patch_y, n_cols, indices_custom, inverse_lookup, patch, leaves, k_neighbours, max_propagate=-1):

    # Clamp propagate amount as to not OOB
    if max_propagate < 1:
        max_propagate = k_neighbours
    max_propagate = min(max_propagate, k_neighbours)

    # if it is not the first row, propagate patches
    for k in range(max_propagate):
        if patch_y > 0:

            # (1) patch index "above"
            location_above = n_cols*(patch_y - 1) + patch_x
            index_of_patch_above = indices_custom[location_above, k]

            # 'Reverse' the spatial traversal we have done to get propagation nearest neighbour patch
            # additionally checking for out of bounds
            if index_of_patch_above + n_cols < len(inverse_lookup):
                index_of_propagation = index_of_patch_above + n_cols
            else:
                index_of_propagation = index_of_patch_above

            # Retrieve the leaf that this patch belongs to
            propagated_node = inverse_lookup[index_of_propagation]
            # Add it to our brute force pool
            best_neighbours = brute_force(patch, propagated_node, leaves, best_neighbours, k_neighbours)

            # (2) propagate 1 diagonal (top-left)
            if patch_x > 0:

                location_above_left = n_cols*(patch_y - 1) + patch_x - 1
                index_of_patch_above_left = indices_custom[location_above_left, k]

                if index_of_patch_above_left + n_cols + 1 < len(inverse_lookup):
                    index_of_propagation = index_of_patch_above_left + n_cols + 1
                else:
                    index_of_propagation = index_of_patch_above_left

                propagated_node = inverse_lookup[index_of_propagation]
                best_neighbours = brute_force(patch, propagated_node, leaves, best_neighbours, k_neighbours)

# def brute_force(patch, leaves_index, leaves, best_neighbours, k_neighbours):
#
#     points, indices = leaves[leaves_index]
#     diffs = numpy.sum((points - patch)**2, axis=1)**0.5
#
#     for i in range(len(indices)):
#         best_neighbours.append((points[i], indices[i], diffs[i]))
#     best_neighbours.sort(key=lambda x: x[2])
#
#     return best_neighbours[:k_neighbours]
#
def brute_force(patch, leaves_index, leaves, best_neighbours, k_neighbours):

    points, indices = leaves[leaves_index]
    diffs = numpy.sum((points - patch)**2, axis=1)**0.5
    neighbour_candidates = numpy.vstack((diffs, indices))
    if best_neighbours is not None:
        neighbour_candidates = numpy.hstack((neighbour_candidates, best_neighbours))
    neighbour_candidates = neighbour_candidates[:, neighbour_candidates[0,:].argsort()][:, :k_neighbours]
    return neighbour_candidates







