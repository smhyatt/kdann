import "lib/github.com/diku-dk/sorts/merge_sort"

-- ==
-- entry: main
--
-- compiled input { 3i32 1024i32 8024.0f32 3000.0f32 }
-- output { [8192.0f32, 4096.0, 12288.0, 2048.0, 6144.0, 10240.0, 14336.0, 1024.0, 3072.0, 5120.0, 7168.0, 9216.0, 11264.0, 13312.0, 15360.0] [22i32, 21, 20, 19, 23, 24, 25, -1, -1, -1, -1, -1, -1, -1, -1, -1] 7i32 }

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
--                (leaves: [][]f32) (best_neighbour: *[]f32) : [k]f32 =
--   let best_neighbours = best_neighbour in
--   map2 (\qp leaf ->
--       map (\lp ->
--           let dist = miniEuclidean qp lp
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
--   ) (replicate num_leaves q) leaves[new_leaf_idx]


let slowBruteForce (q: f32) (k: i32) (new_leaf_idx: i32) (num_leaves: i32) 
                   (leaves: [][]f32) (h: i32) =
    -- let idx = getQueriedLeaf h ppl new_leaf_idx in
    let idx = new_leaf_idx in
    map (\leaf ->
       miniEuclidean q leaf
    ) leaves[idx]




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


-- h:   height of the tree (excluding the leaves)
-- ppl: # of points per leaf
-- q:   the query
-- knn: the worse nearest neighbour
-- run with: echo "3 1024 8024.0f32 3000.0f32" | ./test-trav-maria-new
entry main (h: i32) (ppl: i32) (q: f32) (k: i32) (knn: f32)=
  let num_nodes  = (1 << (h+1)) - 1
  let num_leaves =  1 << (h+1)
  -- let num_patches_per_leaf = 3

  -- build a naive tree that contains the values: [0 ... num_leaves * ppl - 1]
  let (tree_vals, linds)  =
      loop (split_vals, linds) = (replicate num_nodes 0.0f32, replicate num_leaves 0i32)
      for i < (h+1) do
        let beg = (1 << i) - 1
        let len = 1 << i
        let inds = map (+beg) (iota len)
        -- let linds = map (+len) (iota len)
        let num_leaves_per_parent = num_leaves / len
        let num_points_per_parent = num_leaves_per_parent * ppl
        let vals = map (\k -> r32 ((2*k+1) * num_points_per_parent / 2)) (iota len)
        in  (scatter split_vals inds vals, inds)
  
  let leavesindex = map (+((1 << (h+1)) - 1)) (iota (1 << (h+1))) |> trace
  
  -- let leaves  =
  --     loop ls = replicate num_leaves 0i32
  --     for i <= (h+1) do
  --       let beg = (1 << i) - 1
  --       let len = 1 << i
  --       let inds = map (+beg) (iota len) |> trace
  --       let lval = map (\k -> r32 ((2*k+1) * num_points_per_parent / 2)) (iota len)

  -- let in_leaves = replicate ppl f32.nan
  -- let leaves = replicate num_leaves f32.nan
  let leaves = map (\outer -> 
      map (\inner ->
          let inp = (outer-inner) * (inner**inner)
          in (r32 inp)
      ) (iota ppl) 
  ) (iota num_leaves)
  -- -- let new = scatter leaves linds tmp |> trace
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
        
        let tm = new_leaf_idx |> trace
        let leaf_idx = (new_leaf_idx-15) |> trace
        let candidates = if new_leaf_idx != -1
                         then let candidates = candidates ++ 
                         slowBruteForce q k leaf_idx num_leaves leaves h in candidates
                         else candidates
        
        in  (visits, stack, new_leaf_idx, i+1, candidates)

  let best_neighbours = kmin2 k candidates

  in (tree_vals, visits, loop_count, best_neighbours)












