

# KD-Tree

1. How is the tree represented in an array? 

split_values: values of split nodes
split_dimensions: dimension of split nodes
leaves: list of leaves
inverse_lookup: per patch, pointer to leaf (int)

Depth: 15
Leaves number elements in list: 			16384
inverse_lookup number elements in list: 	1517009
split_values number elements in list: 		32767
split_dimensions number elements in list: 	32767


Values from lists up to 10: 

```
inverse_lookup: 3144
split_values: -95.56925964355469
split_dimensions: 0
inverse_lookup: 3265
split_values: -0.17457880079746246
split_dimensions: 4
inverse_lookup: 3285
split_values: 239.2577362060547
split_dimensions: 0
inverse_lookup: 3133
split_values: -2.226677179336548
split_dimensions: 2
inverse_lookup: 3099
split_values: -1.7034204006195068
split_dimensions: 2
inverse_lookup: 1141
split_values: -0.27830997109413147
split_dimensions: 2
inverse_lookup: 8780
split_values: 601.2225341796875
split_dimensions: 0
inverse_lookup: 8775
split_values: -264.4649963378906
split_dimensions: 0
inverse_lookup: 9002
split_values: -271.91455078125
split_dimensions: 0
inverse_lookup: 8774
split_values: -288.33160400390625
split_dimensions: 0
```


2. How are the leaves stored and what format? 

```
Leaves: [array([[-2.98042101e+02, -8.38632241e+01, -8.18662191e+00,
         1.38791646e+01, -2.29637412e+01,  2.26290946e+00,
        -1.00635310e+00,  1.86364249e+00],

       [-2.88887737e+02, -8.35321184e+01, -7.53240821e+00,
         1.50017053e+01, -2.43169210e+01,  2.25997425e+00,
         2.83608103e+00,  5.37344469e+00],
       
       [-2.76242474e+02, -7.09388406e+01, -3.63197613e+00,
         6.42673310e+01, -2.73578567e+01,  1.23367403e-01,
        -6.36905962e+00, -9.05103046e+00],
       
       [-2.81562027e+02, -5.04291319e+01, -6.32096389e+00,
         3.74430609e+01, -3.41724559e+01,  1.95054138e+00,
         5.01781987e+00,  9.19437026e+00],
       
         (...)

       [-2.88130564e+02, -1.37419653e+01, -2.40344746e+00,
         1.52511911e+01, -2.47197873e+01, -8.49930534e-01,
        -7.03554117e-01,  5.79416992e+00],
       [-2.83150592e+02, -1.37332712e+01, -6.52551109e+00,
         1.81814493e+01, -3.65019600e+01, -5.10093198e-01,
         7.57160461e+00,  7.06209826e+00]]), 
       array([1417805, 1417806, 1417678, 1147934, 1010280, 1147933, 1317109,
       1283169, 1319022, 1317108, 1147932, 1514339, 1516252, 1508600,
       1506687,  867426, 1288409, 1504774, 1502861, 1319021,  961124,
       1403388, 1516251, 1504773, 1502860, 1290322,  804273, 1317107,
       1374506, 1319020, 1372593, 1428285,  802361, 1230632, 1506685,
       1516250, 1504772, 1502859, 1232545, 1447413, 1370680, 1234458,
       1223281, 1445500, 1368767, 1228718, 1224892, 1226805, 1230631,
       1232544, 1421920, 1290321, 1431485, 1420008, 1421919, 1433397,
       1426373, 1420007, 1435310, 1224446, 1433398, 1222533, 1228717,
       1226804, 1424460, 1431487, 1418095, 1230630, 1437223, 1361115,
       1420006, 1363028, 1435311, 1418094, 1443588, 1433399, 1416182,
       1433400, 1437224, 1370679, 1086131, 1418093, 1416181, 1435312,
       1433401, 1318619, 1265449, 1362619, 1391314, 1261622, 1391315,
       1435313])]
```


3. What information is stored in the internal nodes? 




## General info

Shape of image A: (800, 1920, 3)
Shape of image B: (800, 1920, 3)
Patches created for image A: (1517009, 8, 8, 3)
Patches created for image B: (1517009, 8, 8, 3)
Subset of patches created for image A: (1000, 192)
Subset of patches created for image B: (1000, 192)
Patches reduced for image A: (1517009, 8)
Patches reduced for image B: (1517009, 8)
K-d tree has been fitted ...
Traversing sklearn
Building propagated k-d tree version ...
Going for a depth of: 15
Depth: 15





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




