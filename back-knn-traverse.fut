import "lib/github.com/diku-dk/sorts/merge_sort"

-- ==
-- entry: main
--
-- compiled random input { [3510]f32 [3510]f32 }

let real_sqrt = f32.sqrt


let getParent (node_index: i32) = (node_index-1) / 2


let isLeaf (h: i32) (node_index: i32) = node_index >= (1 << (h+1)) - 1


let getQueriedLeaf (h: i32) (ppl: i32) (q: f32) =
    let leaf_ind = (t32 q) / ppl
    in  leaf_ind + (1<<(h+1)) - 1


let addToSecond (e: i32) : i32 = if (e & 1) == 1 then 1 else -1


let sqr_distance [n] (vct1 : [n]f32) 
                     (vct2 : [n]f32) : [n]f32 = 
    map2 (\p1 p2 -> (p1-p2)*(p1-p2)) vct1 vct2


let euclidean [n] (vct1 : [n]f32) 
                  (vct2 : [n]f32) : f32 =
    real_sqrt (reduce (+) 0.0 (sqr_distance vct1 vct2))


let miniEuclidean (q: f32) (pix: f32) : f32 =
  ((pix-q) * (pix-q)) ** 0.5f32


let kmin [m] (k : i32) (dists : [m](i32, f32)) : ([k]i32, [k]f32) = 
    let fullarr = merge_sort_by_key (.1) (<=) dists
    in  unzip fullarr[0:k]


let kmin2 (k : i32) (dists : []f32) =
    let fullarr = merge_sort (f32.<=) dists
    in  fullarr[0:k]


let scatter2D (idx_lst:[]i32) (val_lst:[][]f32): [][]f32 =
    map (\ind -> map (\x -> x) (val_lst[ind]) )   idx_lst

let lessThan   (x:f32) (y:f32) = x > y  && x != f32.inf && y != f32.inf
let largerThan (x:f32) (y:f32) = x <= y && x != f32.inf && y != f32.inf

let getEdge (lsts : [][]f32) (expr : (f32 -> f32 -> bool)) =
      map (\lst ->
          reduce (\x y -> if expr x y
                          then y 
                          else x
                 ) lst[0] lst
          ) lsts


-- This is implemented for 1-dim
-- height: the height of the tree (without leaves)
-- tree: the k-d tree, denoted `split_values` in Fabian's code
-- query: our query (1-dim)
-- knn:    the worse nearest neighbour
-- last_leaf: last visited leaf
-- stack:  array of booleans (which should be represented as an int)
--         which denotes whether the `second child` of a node has
--         been visited already
-- Results: the index of the new leaf and the new stack
--
let traverseOnce (height:        i32)  (median_dims: []i32)
                 (median_vals: []f32)  (knn:           f32)
                 (query:       []f32)  (stack:         i32) 
                 (last_leaf:     i32)  : (i32, i32) =

  -- trivial functions for reading/writing from the stack
  let setVisited (stk: i32) (c: i32) : i32 =
      stk | (1 << c)
  let resetVisit (stk: i32) (c: i32) : i32 =
      stk & !(1 << c)
  let isVisited (stk: i32) (c: i32) : bool =
      (stk & (1 << c)) > 0i32

  let (parent_rec, stack, count, rec_node) =
      loop (node_index, stack, count, rec_node) =
           (last_leaf, stack, height, -1)
            while (node_index != 0) && (rec_node < 0) do
                -- go up the tree (and back on the stack) and find the new
                -- parent whose `second` child was not visited AND its `second`
                -- child satisfies the median condition (hence at least one
                -- of its leaves need to be visited). The parent is saved
                -- in `parent_rec`, the `second` satisfying child in `rec_node`
                -- If root has been reached and its `second` has been visited
                -- then `parent_rec` is the root and `rec_node` is -1 by convention.
                let parent = getParent node_index in

                if isVisited stack count
                then (parent, stack, count-1, -1)
                else
                  -- if abs(split_values[node_index] - query_patch[split_dimensions[node_index]]) < (best_neighbours[0][-1] / alpha): # "< *1"
                  let to_visit = (f32.abs (median_vals[parent] - query[median_dims[parent]])) < knn in
                  if !to_visit
                  then (parent, stack, count-1, -1)
                  else
                    let second = node_index + addToSecond node_index
                    let stack  = setVisited stack count in
                    (parent, stack, count, second)


  let (new_leaf, stack, _) =
      if parent_rec == 0 && rec_node == -1
      then -- we are done, we are at the root node
           -- and its second child has been visited
           (-1, stack, 0)

      else loop (node_index, stack, count) =
                (rec_node, stack, count)
           while !(isLeaf height node_index) do
              -- now traverse downwards by starting at `rec_node`
              -- and by computing and following `first` until you
              -- reach a new leaf
              let count = count + 1
              let stack = resetVisit stack count in
              -- go left if query_patch[split_dimensions[node_index]] <= split_values[node_index]:
              if query[median_dims[node_index]] <= median_vals[node_index]
              then ((node_index+1)*2-1, stack, count)
              else ((node_index+1)*2, stack, count)

  in (new_leaf, stack)




let firstTraverse (height:  i32)  (median_dims: []i32)
                  (query: []f32)  (median_vals: []f32) =

    let new_leaf = loop node_index = 0
        while !(isLeaf height node_index) do
          if query[median_dims[node_index]] <= median_vals[node_index]
          then (node_index+1)*2-1
          else (node_index+1)*2

    in new_leaf





let buildTree [m] [d] (imB : [m][d]f32) (h: i32) (num_nodes: i32)  =

    let (reference, median_vals, median_dims) =
        loop(reference, median_vals, median_dims) =
          (imB, replicate num_nodes 0.0f32, replicate num_nodes 0i32)
        for level < (h+1) do
            let num_nodes_per_lvl = 1 << level
            let num_points_per_node_per_lvl = m // num_nodes_per_lvl
            let referencep = unflatten num_nodes_per_lvl num_points_per_node_per_lvl reference
      
            let (reference, medians, dims) = 
                unzip3 <|
                map2 (\i node_arr ->
                        let dim_arrs = transpose node_arr
                        let mini = getEdge dim_arrs lessThan
                        let maxi = getEdge dim_arrs largerThan
                        let diffs = map (\di -> maxi[di]-mini[di]) (iota d)
                        let (dim,_) = reduce (\ (i1,v1) (i2,v2) -> if v1>v2 
                                                                   then (i1,v1) 
                                                                   else (i2,v2)) 
                                             ((-1),(-f32.inf)) <| zip (iota d) diffs
                        let work_dim = map (\x -> (x, copy node_arr[x,dim]) ) (iota num_points_per_node_per_lvl)
                        let d_sort_idxs = work_dim |> merge_sort_by_key (.1) (<=) |> map (.0)
                        let node_arrp = scatter2D d_sort_idxs node_arr
                        let median = node_arrp[num_points_per_node_per_lvl // 2, dim]
                        in (node_arrp, median, dim)
                    ) (iota num_nodes_per_lvl) referencep

            let med_inds = map (\j -> (num_nodes_per_lvl-1) + j) (iota num_nodes_per_lvl)
            in (flatten reference, scatter median_vals med_inds medians, scatter median_dims med_inds dims)
    
    in (reference, median_vals, median_dims)



-- h:   height of the tree (excluding the leaves)
-- ppl: # of points per leaf
-- q:   the query
-- knn: the worse nearest neighbour
-- run with: echo "3 1024 8024.0f32 3000.0f32" | ./test-trav-maria-new
-- entry main (h: i32) (ppl: i32) (q: f32) (k: i32) (knn: f32) =
entry main [m] [d] (imA : [m][d]f32) (imB : [m][d]f32) (h: i32) =
  let num_nodes  = (1 << (h+1)) - 1
  let num_leaves =  1 << (h+1)
  let ppl = (m + num_nodes) / num_leaves  -- ceil(m / (2^(h+1)))
  -- let k = 2i32
  let knn = 30000.0f32
  let mp  = ppl * num_leaves
  let num_pads  = mp - m
  let pad = map (\_ -> map (\_ -> f32.inf) (iota d)) (iota num_pads)
  let imB = imB ++ pad
  -- let final_leaf_len = mp // num_leaves

  -- build the tree of image B
  let (leaves, median_vals, median_dims) = buildTree imB h num_nodes
  
  let (init_leaves, imA_idxs) = 
      unzip <|
      map (\a ->
        let q = imA[a]
        let init = firstTraverse h median_dims q median_vals
        in (init, a)
      ) (iota m)


  let (not_completed_queries, last_leaves, stack) =
      loop (ncq, last, stack) = (imA_idxs, init_leaves, replicate m 0i32)
        while (length ncq) > 0 do

          let (new_leaves, new_stack) =
              unzip <|
              map3 (\nq ll st ->
                      let q = imA[nq]
                      in traverseOnce h median_dims median_vals knn q st ll
                   ) ncq last stack

          let (new_leavesp, new_stacksp, ncqp) =
                unzip3 <| filter (\(ind,_,_) -> ind != -1) <| zip3 new_leaves new_stack ncq

          in (ncqp, new_leavesp, new_stacksp)

  in (median_vals, median_dims, not_completed_queries)




