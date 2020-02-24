

# 

1. How is the tree represented in an array? 


2. How are the leaves stored and what format? 


3. What information is stored in the internal nodes? 










# KNN Notes

For choosing k=square root of training set size. From Fabian. This seems to be some theoretical result specific to a class of supervised learning using nn classiefiers , but in most/all practical cases one chooses k a constant

Or it can be computed by some preliminary/tunning step (think crossvaludation on a set of repræsentative input)

So I think it is safe to consider it a constant for our purposes

For the categories thing... those are also specific to classification problem

1. Most of the k-nn implementation we work on is independent of the application domain

2. But even in the patch sampling domain , it still makes sense to compute nontrivial k-nn (k>1)
	
	1. in the presentation they are saying they use the pixel with a similar neighborhood to fill in the image or some such —- the neighborhood is more exact if more than one neighbor are considered probably , so in my mind k>1 makes sense. Similarly if you google “texture synthesis” and search nearest neighbor ... the same “local neighborhood” idea comes up.

	2. particular to the “propagation” algorithm : computing k-nn with k>1 allows one to propagate more leafs in which each patch on the next row searches his nearest neighbors so it might improve performance

	3. and as you are pointing out patches are overlapping hence similar , so there might be many instances of the same nearest neighbour (maybe it’s useful somehow to know how many exact matches and where they are situated )


What I’m pointing out is that even if you just need K=1 as a final result , computing with a greater K might still be beneficial because of the “propagation” phase (k>1 will increase the chances of having several leaves as candidates rather than just 1)




