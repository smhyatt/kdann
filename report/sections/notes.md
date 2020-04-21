


## PCA

Given a collection of points in two, three, or higher dimensional space, a "best fitting" line can be defined as one that minimizes the average squared distance from a point to the line. The next best-fitting line can be similarly chosen from directions perpendicular to the first. Repeating this process yields an orthogonal basis in which different individual dimensions of the data are uncorrelated. These basis vectors are called principal components, and several related procedures principal component analysis (PCA).

Given a collection of points in two or higher dimensional space a principal component analysis (PCA) can be created by first choosing the line that minimises the average squared distance from a point to the line, second choosing the line perpendicular to the first, and repeating the process . 

Given a collection of points in two or higher dimensional space a principal component analysis (PCA) can be created by first choosing the line that minimises the average squared distance from a point to the line, resulting in an Eigenvector, second choosing the line perpendicular to the first, resulting in a new Eigenvector, and repeating the process will result in orthogonal basis vectors. These vectors are called principal components, and several related procedures principal component analysis (PCA).

by maximising the sum of the squared distances from the projected points to the origin. 

Cocktail mix of gene 1 and 2 are i.e. PC1 is in mathematical terms called linear combination of variables. 

The Eigenvector for PC2 is the sum of squares of the distances between the projected points and the origin. 
-> this is done using Single Value Decomposition (SVD)




















```
Main(k) {
	imA, imB = PCA(imageA), PCA(imageB)
	tree = BuildTree(imB, imB.1, 0, 0)
	neighbours = None

	foreach query in imA do {
		neighbours = Traverse(tree, query, 0, neighbours, k)
		Propagate(tree, query, neighbours, k)
	}

}

Traverse(tree, query, nodeIndex, neighbours, k) {
	if IsLeaf(nodeIndex) then {
		return BruteForce(tree, query, nodeIndex, neighbours, k)
	}

	currentDimOfNode = tree.dimensions[nodeIndex]
	currentMedianOfNode = tree.medianValues[nodeIndex]
	currentQueryValue = query[currentDimOfNode]

	if currentQueryValue <= currentMedianOfNode then {
		first = GoLeft(nodeIndex)
		second = GoRight(nodeIndex)
	}

	else {
		first = GoRight(nodeIndex)
		second = GoLeft(nodeIndex)
	}

	neighbours = Traverse(tree, query, first, neighbours, k)
	worstNeighbour = last neighbours

	if (currentMedianOfNode - currentQueryValue) < worstNeighbour then {
		neighbours = Traverse(tree, query, second, neighbours, k)
	}

	return neighbours
}

BuildTree(patches, indices, depth, index){
	maxDepth = ComputeMaxDepth(patches)

	if depth < (maxDepth-1) then {
		dim = GetSplitDimension(patches)
		indices = SortByDim(patches, dim)
		points = patches[indices]
		medianIdx = GetMedianIdx(indices)
		median = GetMedian(points)
		tree = (median, dim)
		depth = depth + 1
		leftIdx  = AddToLeft(index)
		rightIdx = AddToRight(index)

		BuildTree(patches[: medianIdx], indices, depth, leftIdx)
		BuildTree(patches[medianIdx :], indices, depth, rightIdx)
	}

	else {
		leaves[index] = SortLeavesByIndices(patches, indices)
	}
}
```


```
\begin{algorithm}
\caption{My algorithm}\label{euclid}
\begin{algorithmic}[1]
\Procedure{MyProcedure}{}
\State $\textit{stringlen} \gets \text{length of }\textit{string}$
\State $i \gets \textit{patlen}$
\BState \emph{top}:
\If {$i > \textit{stringlen}$} \Return false
\EndIf
\State $j \gets \textit{patlen}$
\BState \emph{loop}:
\If {$\textit{string}(i) = \textit{path}(j)$}
\State $j \gets j-1$.
\State $i \gets i-1$.
\State \textbf{goto} \emph{loop}.
\State \textbf{close};
\EndIf
\State $i \gets i+\max(\textit{delta}_1(\textit{string}(i)),\textit{delta}_2(j))$.
\State \textbf{goto} \emph{top}.
\EndProcedure
\end{algorithmic}
\end{algorithm}
```


```
Main(k) {
	imA, imB = PCA(imageA), PCA(imageB)
	tree = BuildTree(imB, imB.1, 0, 0)

	foreach query in imA do {
		neighbours = Traverse(tree, query, 0, neighbours, k)
		Propagate(tree, query, neighbours, k)
	}

}


Traverse(tree, query, nodeIndex, neighbours, k) {
	if IsLeaf(nodeIndex) then {
		return BruteForce(tree, query, nodeIndex, neighbours, k)
	}

	currentDimOfNode = tree.dimensions[nodeIndex]
	currentMedianOfNode = tree.medianValues[nodeIndex]
	currentQueryValue = query[currentDimOfNode]

	if currentQueryValue <= currentMedianOfNode then {
		first = GoLeft(nodeIndex)
		second = GoRight(nodeIndex)
	}

	else {
		first = GoRight(nodeIndex)
		second = GoLeft(nodeIndex)
	}

	neighbours = Traverse(tree, query, first, neighbours, k)
	worstNeighbour = last neighbours

	if (currentMedianOfNode - currentQueryValue) < worstNeighbour then {
		neighbours = Traverse(tree, query, second, neighbours, k)
	}

	return neighbours
}


BuildTree(patches, indices, depth, index){
	maxDepth = ComputeMaxDepth(patches)

	if depth < (maxDepth-1) then {
		dim = GetSplitDimension(patches)
		indices = SortByDim(patches, dim)
		points = patches[indices]
		medianIdx = GetMedianIdx(indices)
		median = GetMedian(points)
		tree = (median, dim)
		depth = depth + 1
		leftIdx  = AddToLeft(index)
		rightIdx = AddToRight(index)

		BuildTree(patches[: medianIdx], indices, depth, leftIdx)
		BuildTree(patches[medianIdx :], indices, depth, rightIdx)
	}

	else {
		leaves[index] = SortLeavesByIndices(patches, indices)
	}
}
```







