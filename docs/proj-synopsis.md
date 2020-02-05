

# 1 Project Description 

<!-- ## 1.1 Motivation -->

Patch matching or Computing nearest-neighbour fields (NNFs) between two images is useful for solving various 
computer vision problems. However, computing NNFs of two images is computationally 
challenging since both sets are of image sizes. Finding the Approximate NNF (ANNF) using 
Propagation-Assisted KD-Trees \cite{He Sun} is proven 10-20 times faster obtaining a 
solution of equal accuracy compared to the regular NNF. Despite this speedup the ANNF via 
Propagation-Assisted KD-Trees still has room for optimizations w.r.t. performance, due to the application 
of brute-force in order to search for NNFs. The outline of the algorithm works as follows. 


1. Patches
	Representing the images as matrices of inner matrices where each inner matrix represents the top left pixel of a 

2. Creating KD-Trees

3. Search Strategies

4. 

5. 


<!-- Although the ANNF using Propagation-Assisted KD-Trees \cite{He Sun} is  -->

This project proposes parallelizing the computational heavy bottlenecks of the ANNF via 
Propagation-Assisted KD-Trees with the goal of achieving a remarkable speedup. 

The approach is to use Futhark and C++ to translate the computational bottlenecks to the GPU 
and exploit locality of reference in the Propagation step as well as the patches overlapping. 






<!-- ## 1.2 Problem Statement -->


# 2 Learning Objectives


<!-- # 3 Plan -->




<!-- Given two images A and B, in which each point is 3-channel color (hence 3 dims/ints), 
we decompose them to say 5x5 patches. One can now see the images as a matrix of patches
in a 75-dimension space, i.e., a patch has 5x5x3 components.

The problem at hand is to find for each patch from image A its approximate nearest
neighbor in image B.   The difficulty is that since the images are big, searching
for the nearest neighbor in a brute-force way---by comparing each patch in A with
each patch in B---is too expensive. -->






<!-- 
V. How do we approach it?

We pragmatically start to parallelize what takes the longest time to execute,
and then we move to the next computational bottleneck and so on. We can use
Futhark for implementation and its python code generator, with which we can
easily translates parts of the program to Futhark and link them back in the
original program.

The computational bottleneck are steps III.3.b and III.4. We can start parallelizing
there. For example we will probably start with III.3.b: we get the input and the 
result by running and printing from the python program, then make a reference 
input/result for Futhark and then start translating step III.3.b to Futhark,
until it validates. However, note that Futhark does not support recursive call,
so we will need to rewrite the recursive calls as a loop, which is relatively 
straightforward for III.3.b (but tricky for III.3.a).
 
Of course, ideally all the steps will be translated to GPU, but we are
time constrained, so we will address this pragmatically.
 -->






