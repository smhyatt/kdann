
Accelerating Approximate Nearest-Neighbours via Propagation-Assisted KD-Trees on GPUs


# Project Description 

Computing nearest-neighbour fields (NNFs) between two images is useful for solving various computer vision problems. One common method is applying brute-force which has the complexity of O(n^2), while it is easy to implement it is also infeasible when n is large. 
Another common solution is using KD-Trees which has an average complexity of O(n lg n). While this offers a cheaper traversal it still suffers from the curse of high dimensionality. Thus, the trade-off is accuracy for lower dimensionality and reduced algorithmic complexity. 

Dimensionality and tree traversal can be further optimized by applying NNF in an approximate fashion that does not guarantee an exact solution, however the result has been found to be good enough in practice. 

He and Sun have proposed one such method [1] which is claimed to be 10-20 times faster than other ANNF methods of comparable accuracy but it has only been evaluated on sequential CPU systems. The outline of the algorithm works as follows. 

Assuming two similar images A and B: 

1. Choose a fix number of dimensions (say 20), and pick a number (say 1000) of random 
   patches from the images and perform Principal Component Analysis (PCA), i.e., reduce 
   dimensionality by picking the most important 20 dimensions.

2. Build a KD-tree for the patches in B: at each recursive step,
   we choose and split the space by the median value.
   The median split results in a binary balanced tree. The recursion continues until
   each leaf (but the last one) contains a statically chosen 'm' patches (say 50). 
        
3. Approximate search through the KD-Tree:

 a) Find an exact NNF solution for the first row of patches in A, by fully traversing 
 	through the KD-Tree and performing a brute-force search at each encountered leaf.

 b) For the remaining patches we will get an initial estimate from the leaf to which 
 	they belong, requiring a simpler implementation, i.e., no backtracking. (At the 
 	leaf level we still perform a brute-force search).

4. Propagation Step: note that the NNF for the patches of the first row are highly
   accurate. We can use them to improve the accuracy of the other by a
   sequential-propagation procedure which updates each patch in row `i` in the
   following way: 
        a) lookup the leaf `l_{i-1}` of the top neighbour (i.e., row `i-1` computed 
            in previous time step)
        b) perform a brute-force w.r.t. that leaf (`l_{i-1}`), and choose the best
            between the resulted ANNF and the current result (from step 3.b).


# Project Goal

The aim of the project is to implement a approach similar with He and Sun's, however utilizing highly parallel hardware such as GPUs. To this extent we are going to develop a data parallel implementation of the main algorithmic steps in the Futhark language and/or perhaps CUDA. We are going to identify the performance bottlenecks and study techniques aimed at solving them. 



# References 

[1] Computing Nearest-Neighbour fields Propagation-Assisted KD-Trees, Kaiming He and Jian Sun. 











