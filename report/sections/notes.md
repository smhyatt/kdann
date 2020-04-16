

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







