import "lib/github.com/diku-dk/sorts/merge_sort"
import "lib/github.com/diku-dk/sorts/radix_sort"

-- ==
-- entry: main
--
-- compiled random input { [8388608][8]f32 [8388608][8]f32 13i32 }


let getParent (node_index: i32) = (node_index-1) / 2

let isLeaf (h: i32) (node_index: i32) = node_index >= (1 << (h+1)) - 1

let addToSecond (e: i32) : i32 = if (e & 1) == 1 then 1 else -1


let seqEuclidean [n] (vct1: [n]f32) (vct2: [n]f32) : f32 =
    let dist = loop dist = 0.0f32
      for i < n do
          let q = vct1[i]
          let p = vct2[i]
          in ((q-p)*(q-p) + dist)
    in (f32.sqrt dist)


let sqr_distance [n] (vct1: [n]f32) 
                     (vct2: [n]f32) : [n]f32 = 
    map2 (\p1 p2 -> (p1-p2)*(p1-p2)) vct1 vct2


let euclidean [n] (vct1: [n]f32) 
                  (vct2: [n]f32) : f32 =
    f32.sqrt (reduce (+) 0.0 (sqr_distance vct1 vct2))


let kmin (k: i32) (dists: []f32) =
    let fullarr = merge_sort (f32.<=) dists
    in  fullarr[0:k]


let slowBruteForce3D [m] [n] [d] (q: [d]f32) (leaf_idx: i32) 
                               (leaves: [m][n][d]f32) =
    map (\patch ->
          euclidean q patch
        ) leaves[leaf_idx]


let bruteForce [n][k][d] (q: [d]f32) (leaves: [n][d]f32) (leaf_idxs: [n]i32)
                         (current_knn:     [k](i32,f32)) : [k](i32,f32) =
    if q[0] >= f32.highest
    then copy current_knn
    else
        let nn = copy current_knn
        in loop nn for p < n do
            let patch = leaves[p]
            let dist  = seqEuclidean q patch
            let idx = leaf_idxs[p]
            in let (_, _, nnp) =
                loop (idx, dist, nn) for i < k do
                    let cur_nn = nn[i].1 in
                    if dist <= cur_nn then
                        let tmp_i = nn[i].0
                        let nn[i] = (idx, dist)
                        let idx   = tmp_i
                        let dist  = cur_nn
                        in (idx, dist, nn)
                    else (idx, dist, nn)
            in nnp



-- let inScatter2D [m] [n] [k] 't (arr2D: *[m][k]t) (qinds: [n]i32) (vals2D: [n][k]t) : *[m][k]t =
--     let flat_inds = map (\p ->
--                             map (\q -> qinds[p]*k + q) (iota k)
--                         ) (iota n)
--     let nk = n*k
--     let result = scatter (flatten arr2D) ((flatten flat_inds) :> [nk]t) ((flatten vals2D) :> [nk]t)
--     in unflatten m k result


let scatter2D [m][k][n] 't (arr2D: *[m][k]t) (qinds: [n]i32) (vals2D: [n][k]t) : *[m][k]t =
  let nk = n*k
  let flat_qinds = map (\i -> let (d,r) = (i / k, i % k)
                              in qinds[d]*k + r
                       ) (iota nk)
  let res1D = scatter (flatten arr2D) flat_qinds ((flatten vals2D) :> [nk]t)
  in  unflatten m k res1D


let scatter2Dtuples [m][k][n] (arr2D: *[m][k](i32,f32)) (qinds: [n]i32) (vals2D: [n][k](i32,f32)) : *[m][k](i32,f32) =
  let nk = n*k
  let flat_qinds = map (\i -> let (d,r) = (i / k, i % k)
                              in qinds[d]*k + r
                       ) (iota nk)
  let res1D = scatter (flatten arr2D) flat_qinds ((flatten vals2D) :> [nk](i32,f32))
  in  unflatten m k res1D


let gather2Dtuples (idx_lst: []i32) (val_lst: [][](i32,f32)) : [][](i32,f32) =
    map (\ind -> map (\(i,d) -> (i,d)) (val_lst[ind])) idx_lst


let gather2D (idx_lst: []i32) (val_lst: [][]f32) : [][]f32 =
    map (\ind -> map (\x -> x) (val_lst[ind])) idx_lst


let gather (idx_lst: []i32) (val_lst: []i32) : []i32 =
    map (\x -> val_lst[x]) idx_lst


let lessThan   (x: f32) (y: f32) = x > y  && x != f32.inf && y != f32.inf
let largerThan (x: f32) (y: f32) = x <= y && x != f32.inf && y != f32.inf

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
let traverseOnce [d][n] (height:             i32)  (median_dims:     [n]i32)
                        (median_vals:     [n]f32)  (wknn:               f32)
                        (query:           [d]f32)  (stack:              i32) 
                        (last_leaf:          i32)  (lower_bounds: [n][d]f32)
                        (upper_bounds: [n][d]f32)  : (i32, i32) =

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
                  let ack = 
                    loop ack = 0.0f32
                      for i < d do
                          let cur_q = query[i]
                          let lower = lower_bounds[parent,i]
                          let upper = upper_bounds[parent,i] in

                          if cur_q <= lower then
                              let res = (cur_q-lower)*(cur_q-lower)
                              in (ack + res)
                          else if cur_q >= upper then
                              let res = (cur_q-upper)*(cur_q-upper)
                              in (ack + res)
                          else (ack + 0.0)

                  let to_visit = (f32.sqrt ack) < wknn in
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
              if query[median_dims[node_index]] <= median_vals[node_index]
              then ((node_index+1)*2-1, stack, count)
              else ((node_index+1)*2, stack, count)

  in (new_leaf, stack)



let firstTraverse [d] [q] (height:   i32)  (median_dims: [q]i32)
                          (query: [d]f32)  (median_vals: [q]f32) =

    let new_leaf = loop node_index = 0
        while !(isLeaf height node_index) do
          if query[median_dims[node_index]] <= median_vals[node_index]
          then (node_index+1)*2-1
          else (node_index+1)*2

    in new_leaf



let buildTree [m] [d] (imB : [m][d]f32) (h: i32) (num_nodes: i32) =

    let (imB_idxs, reference, median_vals, median_dims, lower_bounds, upper_bounds) =
        loop(imB_idxs, reference, median_vals, median_dims, lower_bounds, upper_bounds) =
          (iota m, imB, replicate num_nodes 0.0f32, replicate num_nodes 0i32, 
            replicate num_nodes (replicate d 0.0f32), replicate num_nodes (replicate d 0.0f32))
        for level < (h+1) do
            let num_nodes_per_lvl = 1 << level
            let num_points_per_node_per_lvl = m // num_nodes_per_lvl
            let referencep = unflatten num_nodes_per_lvl num_points_per_node_per_lvl reference
            let imB_inds   = unflatten num_nodes_per_lvl num_points_per_node_per_lvl imB_idxs

            let (imB_idxs', reference, node_info', lower, upper) = unzip5 <|
                map2 (\node_arr inds ->
                        let dim_arrs = transpose node_arr    |> intrinsics.opaque
                        let mini = getEdge dim_arrs lessThan |> intrinsics.opaque
                        let maxi = getEdge dim_arrs largerThan
                        -- getting the widest spread
                        let diffs   = map (\di -> maxi[di]-mini[di]) (iota d)
                        let (dim,_) = reduce (\(i1,v1) (i2,v2) -> if v1>v2
                                                                  then (i1,v1)
                                                                  else (i2,v2))
                                             ((-1),(-f32.inf)) <| zip (iota d) diffs
                        let work_dim = map (\x -> (x, copy node_arr[x,dim])
                                           ) (iota num_points_per_node_per_lvl)
                        let d_sort_idxs = work_dim |> radix_sort_float_by_key (.1) f32.num_bits f32.get_bit |> map (.0)
                        let im_indices  = gather d_sort_idxs inds
                        let node_arrp   = gather2D d_sort_idxs node_arr
                        let median      = node_arrp[num_points_per_node_per_lvl // 2, dim]
                        let node_info   = (median, dim)
                        in (im_indices, node_arrp, node_info, mini, maxi)

                    ) referencep imB_inds

            let (medians, dims) = unzip node_info'

            let med_inds = map (\j -> (num_nodes_per_lvl-1) + j) (iota num_nodes_per_lvl)
            in (flatten imB_idxs',
                flatten reference,
                scatter median_vals med_inds medians,
                scatter median_dims med_inds dims,
                scatter2D lower_bounds med_inds lower,
                scatter2D upper_bounds med_inds upper)

    in (imB_idxs, reference, median_vals, median_dims, lower_bounds, upper_bounds)


let sortQueriesByLeaves [n] (leaves: [n]i32) : ([n]i32, [n]i32) =
  unzip <| merge_sort 
                (\ (v1,i1) (v2,i2) -> 
                    if v1 < v2 then true  else
                    if v1 > v2 then false else i1 <= i2 )
                (zip leaves (iota n))



entry main [m] [d] (imA : [m][d]f32) (imB : [m][d]f32) (h: i32) =
  let num_nodes  = (1 << (h+1)) - 1
  let num_leaves =  1 << (h+1)
  let ppl  = (m + num_nodes) / num_leaves  -- ceil(m / (2^(h+1)))
  let k    = 3i32
  let mp   = ppl * num_leaves
  let num_pads = mp - m
  let pad = map (\_ -> map (\_ -> f32.inf) (iota d)) (iota num_pads)
  let imB = imB ++ pad
  let num_patches_in_leaf = mp // num_leaves

  -- build the tree of image B
  let (imB_idxs, leaves, median_vals, median_dims, lower_bounds, upper_bounds) = buildTree imB h num_nodes
  let leaves'   = unflatten num_leaves num_patches_in_leaf leaves
  let imB_idxs' = unflatten num_leaves num_patches_in_leaf imB_idxs

  let init_leaves =
      map (\a ->
        let q = imA[a]
        in firstTraverse h median_dims q median_vals
      ) (iota m)

  let (sorted_idxs_fst, ongoing_leaf_idxs_fst) = zip (iota m) init_leaves |> merge_sort_by_key (.1) (<=) |> unzip -- radix_sort_int_by_key (.1) i32.num_bits i32.get_bit |> unzip
  let not_completed_queries = gather sorted_idxs_fst (iota m)

  let ongoing_knn   = replicate m (replicate k (-1i32, f32.inf))
  let completed_knn = copy ongoing_knn
  let stacks  = replicate m 0i32
  let visited = replicate (num_leaves+1) (-1)

  let (_, _, _, completed_knn, _, visited, _, _) =
      loop (ncq, pre_leaf_idx, stacks, completed_knn, ongoing_knn, visited, i, trues) =
        (not_completed_queries, init_leaves, stacks, completed_knn, ongoing_knn, visited, 0i32, m)
          while (length ncq) > 0 do

            let (new_ongoing_knns, new_leaves, new_stacks) =
                unzip3 <|
                map4 (\nq lli st klst ->
                        let q = imA[nq]
                        let lind = (lli-num_nodes)
                        let neighbours = bruteForce q leaves'[lind] imB_idxs'[lind] klst
                        let wknn = neighbours[k-1].1
                        let (new_l, new_s) = traverseOnce h median_dims median_vals wknn q st lli lower_bounds upper_bounds
                        in (neighbours, new_l, new_s)
                     ) ncq pre_leaf_idx stacks ongoing_knn

            let (ongoing_leaf_idxs, sorted_idxs) = sortQueriesByLeaves new_leaves
            let finished = map (\ll -> if ll == -1 then 1 else 0) ongoing_leaf_idxs |> reduce (+) 0
            let trues' = trues - finished

            let not_completed_queries' = gather sorted_idxs ncq
            let ongoing_knn_idxs' = copy not_completed_queries'
            let new_ongoing_knns' = gather2Dtuples sorted_idxs new_ongoing_knns
            let new_stacks' = gather sorted_idxs new_stacks

            in (not_completed_queries'[finished:],
                ongoing_leaf_idxs[finished:],
                new_stacks'[finished:],
                scatter2Dtuples completed_knn ongoing_knn_idxs'[:finished] new_ongoing_knns'[:finished],
                new_ongoing_knns'[finished:],
                scatter visited [i] [trues'],
                i+1,
                trues')


  let with_query_idxs = zip (iota m :> [m]i32) (completed_knn :> [m][k](i32,f32))
  in (median_vals, median_dims, completed_knn, visited , with_query_idxs)

















































