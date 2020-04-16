import "lib/github.com/diku-dk/sorts/merge_sort"

-- ==
-- entry: main
--
-- compiled random input { [3510]f32 [3510]f32 }
-- output { 
-- [8192.0f32, 4096.0f32, 12288.0f32, 2048.0f32, 6144.0f32, 10240.0f32, 14336.0f32, 1024.0f32, 3072.0f32, 5120.0f32, 7168.0f32, 9216.0f32, 11264.0f32, 13312.0f32, 15360.0f32]
-- [22i32, 21i32, 20i32, 19i32, 18i32, 17i32, 16i32, 15i32, 23i32, 24i32, 25i32, 26i32, 27i32, 28i32, 29i32, 30i32]
-- 16i32
-- [1351.0f32, 4476.0f32] }

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
let traverseOnce (height: i32) (tree:    []f32) 
                 (query: f32) (knn:       f32)
                 (last_leaf: i32)
                 (stack: i32) : (i32, i32) =
                 -- (stack : *[]bool) : (i32, []bool) =

  -- trivial functions for reading/writing from the stack,
  --   which is maintained as an array of booleans.
  -- let getPackedInd (stk: []bool) (ind: i32) : bool = stk[ind] 
  -- let setPackedInd (stk: i32) (ind: i32) (v: bool) : *[]bool =
  --     let stk[ind] = v in stk
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

                if isVisited stack count --|> trace
                then (parent, stack, count-1, -1)
                else
                  let to_visit = f32.abs (tree[parent] - query) < knn in
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
              if query <= tree[node_index]
              then ((node_index+1)*2-1, stack, count) 
              else ((node_index+1)*2, stack, count)

  in (new_leaf, stack)


-- let bruteForce (q: f32) (k: i32) (new_leaf_idx: i32) (num_leaves: i32) 
--                (leaves: [][]f32) (best_neighbours: *[]f32) : [k]f32 =
--   map (\leaf ->
--       map (\lp ->
--           let dist = miniEuclidean q lp
--           let idx = lp in
--           let (_, _, bn) =
--           loop (dist, idx, best_neighbours) for i < k do
--               let cur_bn = best_neighbours[i] in
--               if dist <= cur_bn then
--                   best_neighbours with [i] = dist
--                   in (cur_bn, idx, best_neighbours)
--               else
--                   (dist, idx, best_neighbours)
--           in bn
--       ) leaf
--   ) leaves[new_leaf_idx]


let slowBruteForce (q: f32) (new_leaf_idx: i32) (leaves: [][]f32) =
    map (\leaf ->
       miniEuclidean q leaf
    ) leaves[new_leaf_idx]




-- let brute_force (query_patch: []real) (leaves_idx: int) (leaves: []([][]real, []int)) =
    -- let all_dist_inds = map (\i ->
    --     let (candidates, indices) = unzip leaves in 
    --     let patch_cand = candidates[leaves_idx,i]
    --     let patch_idx  = indices[leaves_idx,i]
    --     let dist = euclidean query_patch patch_cand
    --     in (patch_idx, dist)
    --     ) (iota patches_in_leaves)
    
    -- in all_dist_inds
    -- in kmin k_neighbours all_dist_inds


 -- map (\a_patch ->
 --        if a_patch[0] == real_inf
 --        then replicate k (-2i32, real_inf)
 --        else
 --        let  nn = replicate k (-1i32, real_inf)
 --        in loop nn for q < m do
 --            let b_patch = imB[q]
 --            let dist = euclidean a_patch b_patch
 --            let b_idx = q in
 --            let (_, _, nn') =
 --                loop (dist, b_idx, nn) for i < k do
 --                    let cur_nn = nn[i].1  in
 --                    if dist <= cur_nn then 
 --                        let tmp_ind = nn[i].0--cur_idx
 --                        let nn[i] = (b_idx, dist) -- let nn' = nn with [i] <- dist in ... nn
 --                        let b_idx = tmp_ind
 --                        let dist  = cur_nn
 --                        in  (dist, b_idx, nn)
 --                    else    (dist, b_idx, nn)
 --            in  nn'
 --    ) imA 




import "lib/github.com/diku-dk/sorts/merge_sort"

-- ==
-- entry: main
--
-- compiled random input { [96][3]f32 }


let scatter2D (idx_lst:[]i32) (val_lst:[][]f32): [][]f32 =
    map (\i ->
            let new_idx  = copy idx_lst[i]
            in val_lst[new_idx]
        ) (iota (length idx_lst))



let minimum (x:f32) (y:f32) = x > y  && x != f32.inf && y != f32.inf
let maximum (x:f32) (y:f32) = x <= y && x != f32.inf && y != f32.inf

let getEdge (lsts : [][]f32) (expr : (f32 -> f32 -> bool)) =
      map (\lst ->
          reduce (\x y -> if expr x y
                          then y 
                          else x
                 ) lst[0] lst
          ) lsts


entry main [m] [d] (imB : [m][d]f32) =
    let h = 2i32                            -- 8i32 -- 15i32 -- height without leaves
    let num_nodes  = (1 << (h+1)) - 1
    let num_leaves =  1 << (h+1)
    let ppl = (m + num_nodes) / num_leaves  -- ceil(m / (2^(h+1)))
    let mp  = ppl * num_leaves
    let num_pads  = mp - m 
    -- let pad_limit = num_pads > num_leaves
    let pad = map (\_ -> map (\_ -> f32.inf) (iota d)) (iota num_pads)
    let imB = imB ++ pad
    let inner_dims = replicate d 0.0f32

    let (reference, median_vals, median_dims) =
        loop(_, median_vals, median_dims) = 
          (replicate mp inner_dims, replicate num_nodes 0.0f32, replicate num_nodes 0i32)
        for level < (h+1) do
            let num_nodes_per_lvl = 1 << level
            let num_points_per_node_per_lvl = mp // num_nodes_per_lvl
      
            let (reference, medians, dims) = 
                unzip3 <|
                map (\i ->
                        let beg = num_points_per_node_per_lvl * i
                        let end = beg + num_points_per_node_per_lvl -- -1 ??
                        let node_arr = imB[beg:end]
                        let leaf_len = length node_arr
                        let dim_arrs = 
                            map (\k -> map (\w -> copy node_arr[w,k]) (iota leaf_len)) (iota d)
                        let maxi = getEdge dim_arrs maximum
                        let mini = getEdge dim_arrs minimum
                        let diffs = map (\m -> maxi[m]-mini[m]) (iota (length maxi))
                        -- let diffs = map (\q -> 
                        --                     let maxi = reduce f32.max (-f32.inf) dim_arrs[q] |> trace
                        --                     let mini = reduce f32.min f32.inf    dim_arrs[q] |> trace
                        --                     in maxi-mini
                        --                 ) (iota leaf_len) |> trace
                        let big = reduce f32.max (-f32.inf) diffs
                        let dim = map (\ix -> if big != diffs[ix] then 0 else ix) (iota d) |> reduce (+) 0
                        let work_dim = map (\x -> (x, copy node_arr[x,dim]) ) (iota leaf_len)
                        let d_sort_idxs = work_dim |> merge_sort_by_key (.1) (<=) |> map (.0)
                        let node_arrp = scatter2D d_sort_idxs node_arr
                        let median = node_arrp[num_points_per_node_per_lvl // 2, dim] |> trace
                        in (node_arrp, median, dim)
                    ) (iota num_nodes_per_lvl)

            let med_inds = map (\j -> (num_nodes_per_lvl-1) + j) (iota num_nodes_per_lvl)
            in (flatten reference, scatter median_vals med_inds medians, scatter median_dims med_inds dims)
    
    in (reference, median_vals, median_dims)




-- futhark dataget knn.fut "[35170][8]f32 [35170][8]f32" | futhark run knn.fut
-- echo "[3510][8]f32 [3510][8]f32" | futhark run knn.fut

-- h:   height of the tree (excluding the leaves)
-- ppl: # of points per leaf
-- q:   the query
-- knn: the worse nearest neighbour
-- run with: echo "3 1024 8024.0f32 3000.0f32" | ./test-trav-maria-new
-- entry main (h: i32) (ppl: i32) (q: f32) (k: i32) (knn: f32) =
entry main [m] (imA : [m]f32) (imB : [m]f32) =
  let h = 3i32
  let ppl = 1024i32
  let q = 8024.0f32
  let k = 2i32
  let knn = 30000.0f32
  let num_nodes  = (1 << (h+1)) - 1
  let num_leaves =  1 << (h+1)

  -- build a naive tree that contains the values: [0 ... num_leaves * ppl - 1]
  let (tree_vals)  =
      loop (split_vals) = replicate num_nodes 0.0f32
      for i < (h+1) do
        let beg = (1 << i) - 1
        let len = 1 << i
        let inds = map (+beg) (iota len)
        let num_leaves_per_parent = num_leaves / len
        let num_points_per_parent = num_leaves_per_parent * ppl
        let vals = map (\k -> r32 ((2*k+1) * num_points_per_parent / 2)) (iota len)
        in  scatter split_vals inds vals
  
  let leavesindex = map (+((1 << (h+1)) - 1)) (iota (1 << (h+1))) |> trace
  
  -- let leaves  =
  --     loop ls = replicate num_leaves 0i32
  --     for i <= (h+1) do
  --       let beg = (1 << i) - 1
  --       let len = 1 << i
  --       let inds = map (+beg) (iota len) |> trace
  --       let lval = map (\k -> r32 ((2*k+1) * num_points_per_parent / 2)) (iota len)

  -- let in_leaves = replicate ppl f32.nan
  -- let leaves = replicate num_leaves in_leaves
  let leaves = map (\outer -> 
      map (\inner ->
          let inp = (outer-inner) * (inner**inner)
          in (r32 inp)
      ) (iota ppl) 
  ) (iota num_leaves)
  -- let leaves = scatter leaves leavesindex tmp
  -- let getlnum = num_leaves |> trace
  -- let getlind = linds |> trace
  -- get the queried leaf
  let q_leaf = getQueriedLeaf h ppl q
  
  let visits = replicate num_leaves (-1)
  let visits[0] = q_leaf
  let best_neighbours = replicate k (f32.nan)
  let candidates = []

  -- propagate the query `q` through the tree
  let (visits, _, _, loop_count, candidates) =
      loop (visits, stack, last_leaf, i, candidates) =
          (visits, 0i32, q_leaf, 0, candidates)
      while last_leaf != -1 do
        let (new_leaf_idx, stack) =
            traverseOnce h tree_vals q knn last_leaf stack

        let visits = if new_leaf_idx != -1 
                     then let visits[i+1] = new_leaf_idx in visits
                     else visits
        
        let leaf_idx = new_leaf_idx-num_nodes
        let candidates = if new_leaf_idx != -1
                         then let candidates = candidates ++ 
                         slowBruteForce q k leaf_idx num_leaves leaves h in candidates
                         else candidates
        
        in  (visits, stack, new_leaf_idx, i+1, candidates)

  let best_neighbours = kmin2 k candidates

  in (tree_vals, visits, loop_count, best_neighbours)












