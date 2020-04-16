import "lib/github.com/diku-dk/sorts/merge_sort"

-- ==
-- entry: main
--
-- compiled random input { [3510]f32 [3510]f32 }


let getParent (node_index: i32) = (node_index-1) / 2

let isLeaf (h: i32) (node_index: i32) = node_index >= (1 << (h+1)) - 1

let addToSecond (e: i32) : i32 = if (e & 1) == 1 then 1 else -1

let sqr_distance [n] (vct1 : [n]f32) 
                     (vct2 : [n]f32) : [n]f32 = 
    map2 (\p1 p2 -> (p1-p2)*(p1-p2)) vct1 vct2


let euclidean [n] (vct1: [n]f32) 
                  (vct2: [n]f32) : f32 =
    f32.sqrt (reduce (+) 0.0 (sqr_distance vct1 vct2))


let miniEuclidean (q: f32) (pix: f32) : f32 =
  ((pix-q) * (pix-q)) ** 0.5f32


let kmin [m] (k: i32) (dists: [m](i32, f32)) : ([k]i32, [k]f32) = 
    let fullarr = merge_sort_by_key (.1) (<=) dists
    in  unzip fullarr[0:k]

-- let worstknn [] (dists: []f32) =
--     let fullarr = merge_sort (f32.<=) dists
--     in  fullarr[0:k]

let kmin2 (k: i32) (dists: []f32) =
    let fullarr = merge_sort (f32.<=) dists
    in  fullarr[0:k]

let slowBruteForce3D [m] [n] [d] (q: [d]f32) (leaf_idx: i32) 
                               (leaves: [m][n][d]f32) =
    map (\patch ->
          euclidean q patch
        ) leaves[leaf_idx]


let slowBruteForce [m] [d] (q: [d]f32) (leaf_idx: i32) 
                           (leaves: [m][d]f32) =
    euclidean q leaves[leaf_idx]



let scatter2D (idx_lst: []i32) (val_lst: [][]f32) : [][]f32 =
    map (\ind -> map (\x -> x) (val_lst[ind])) idx_lst


-- let insrtScatter2D [m] [d] (res_lst: [m][d]f32) (idx_lst:[]i32)
--                            (val_lst: [m][d]f32) : [m][d]f32 =

--     map (\res -> ) res_lst
--     map (\ind -> map (\x -> res_lst[ind]) (val_lst[ind])) idx_lst

    
--     map (\ind -> map2 (\res v ->
--                     ) (res_lst) (val_lst[ind])) idx_lst
  
--     map (\i1 -> 
--         map (\i2 ->
--                 if i1 == i2 then val_lst[i2] else res_lst[i1]
--             ) (iota m) 
--         ) idx_lst


--     map (\i1 ->
--         map (\i2 ->
--                 if i1 == i2 then val_lst[i2] else res_lst[i1]
--             ) idx_lst |> flatten
--         ) (iota m)


-- let insrtScatter2D [m] [d] [n] (res_lst: [m][d]f32) (idx_lst:[n]i32)
--                            (val_lst:  [m][d]f32) : [m][d]f32 =
--     map (\i2 ->
--         map (\i1 ->
--                 if i1 == i2 then val_lst[i2] else res_lst[i1]
--             ) (iota m)
--         ) idx_lst |> flatten


-- let insrtScatter2D (res_lst: [][]f32) (idx_lst:[]i32)
--                              (val_lst:  [][]f32) =
--       map (\i1 ->
--           map (\i2 ->
--                   if i1 == i2 then val_lst[i2] else res_lst[i1]
--               ) idx_lst
--           ) (iota (length res_lst)) |> flatten



let lessThan   (x:f32) (y:f32) = x > y  && x != f32.inf && y != f32.inf
let largerThan (x:f32) (y:f32) = x <= y && x != f32.inf && y != f32.inf

let getEdge (lsts : [][]f32) (expr : (f32 -> f32 -> bool)) =
      map (\lst ->
          reduce (\x y -> if expr x y
                          then y 
                          else x
                 ) lst[0] lst
          ) lsts


let segScatter [n] [m] (res_lst:  [n][]i32) (idx_lst: [n][m]i32) 
                       (val_lst: [n][m]i32)         : [n][]i32 =
    map3 (\res ind v -> 
              scatter (copy res) ind v 
         ) res_lst idx_lst val_lst


let sortFinishedQueries (elm: i32) : bool = elm != (-1)


let partition2 [n] (expr: (i32 -> bool)) (leaf_idxs: [n]i32)
                   (completed:   [n]i32) (knns:      [n]i32)
                   (stack:       [n]i32) 
                   : (i32, [n]i32, [n]i32, [n]i32, [n]i32) =

    let tflgs = map (\e -> if expr e then 1 else 0) leaf_idxs
    let fflgs = map (\b -> 1 - b) tflgs

    let indsT = scan (+) 0 tflgs
    let tmp   = scan (+) 0 fflgs
    let trues = if n > 0 then indsT[n-1] else -1
    let indsF = map (+trues) tmp

    let inds  = map3 (\leaf indT indF -> if expr leaf 
                                         then indT-1 
                                         else indF-1
                     ) leaf_idxs indsT indsF

    let leaf_idxsp = scatter (replicate n 0i32) inds leaf_idxs
    let completedp = scatter (replicate n 0i32) inds completed
    let knnsp      = scatter (replicate n 0i32) inds knns
    let stackp     = scatter (replicate n 0i32) inds stack
    in  (trues, leaf_idxsp, completedp, knnsp, stackp)





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
                        let work_dim = map (\x -> 
                                              (x, copy node_arr[x,dim])
                                           ) (iota num_points_per_node_per_lvl)
                        let d_sort_idxs = work_dim |> merge_sort_by_key (.1) (<=) |> map (.0)
                        let node_arrp = scatter2D d_sort_idxs node_arr
                        let median = node_arrp[num_points_per_node_per_lvl // 2, dim]
                        in (node_arrp, median, dim)
                    ) (iota num_nodes_per_lvl) referencep

            let med_inds = map (\j -> (num_nodes_per_lvl-1) + j) (iota num_nodes_per_lvl)
            in (flatten reference, 
                scatter median_vals med_inds medians, 
                scatter median_dims med_inds dims)
    
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
  let ppl  = (m + num_nodes) / num_leaves  -- ceil(m / (2^(h+1)))
  let k    = 2i32
  let mp   = ppl * num_leaves
  let num_pads = mp - m
  let pad = map (\_ -> map (\_ -> f32.inf) (iota d)) (iota num_pads)
  let imB = imB ++ pad
  let num_patches_in_leaf = mp // num_leaves

  -- build the tree of image B
  let (leaves, median_vals, median_dims) = buildTree imB h num_nodes
  let leavesp = unflatten num_leaves num_patches_in_leaf leaves

  let (init_leaves, imA_idxs) = 
      unzip <|
      map (\a ->
        let q = imA[a]
        let init = firstTraverse h median_dims q median_vals
        in (init, a)
      ) (iota m)

  let bknns = replicate m (replicate k 0.0f32)
  let stack = replicate m 0i32

  let (not_completed_queries, last_leaves, stack, knn_idxs, cknns, cknnsi) =
      loop (ncq, last_leaves_idx, stack, knni, cknns, cknnsi) = 
        (imA_idxs, init_leaves, stack, iota m, [], [])
          while (length ncq) > 0 do

            let (wknn, knns, new_leaves, new_stack) =
                unzip4 <|
                map3 (\nq lli st ->
                        let q = imA[nq]
                        let test = lli
                        let test = st
                        let neighbours  = slowBruteForce3D q (lli-num_nodes) leavesp
                        let kneighbours = kmin2 k neighbours -- OBS RET TIL AT KUNNE TAGE STØRRE K END ANTAL PATCHES PR BLAD
                        let wknn = kneighbours[k-1]
                        let (new_l, new_s) = traverseOnce h median_dims median_vals wknn q st lli
                        in (wknn, kneighbours, new_l, new_s)
                     ) ncq last_leaves_idx stack

            -- let (new_leavesp, new_stacksp, ncqp) =
            --       unzip3 <| filter (\(ind,_,_) -> ind != -1) <| zip3 new_leaves new_stack ncq

            let (trues, new_leavesp, ncqp, knnip, new_stacksp) =
                partition2 sortFinishedQueries new_leaves ncq knni new_stack

            let completed_knns_idxs = knnip[trues:]
            let completed_knns_idxsp = cknnsi ++ completed_knns_idxs
            -- let bknnsp = insrtScatter2D bknns completed_knns_idxs cur_knns

            let completed_knns = cknns ++ knns[trues:]

            in (ncqp[:trues], new_leavesp[:trues], new_stacksp[:trues], 
                knnip[:trues], completed_knns, completed_knns_idxsp)

  let sorted_knns = zip cknnsi cknns |> merge_sort_by_key (.0) (<=)

  in (median_vals, median_dims, not_completed_queries, cknnsi, cknns, sorted_knns)







-- not_completed_queries = copy queries

-- while (not empty not_completed_queries) do

-- (new_leaves, new_stack) = map3 (tracerseOnce ....) not_completed_queries old_leaves old_stacks

-- (new_leaves', new_stacks', not_completed_queries') = filter (\(ind,_,_) -> ind != -1) <| zip3 new_leaves new_stacks not_completed_queries

-- new_nns = map2 bruteForce new_leaves' not_completed_queries'

-- scatter the new_ns in the proper locations of the global array holding the k-nearest neighbors of all queries

-- In my mind, not_completed_knns is a 2d array in which the first dimension shrinks as we filter out finished queries and the other dimension is “k”

-- But you don’t have to stick with that necessarily ... you are free to strategize yourself as you see fit. It just has to make sense in the end.

-- (not_complete_knns holds the currently known k nearest neighbors for each query that has not completed yet)



























































