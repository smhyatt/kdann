import "lib/github.com/diku-dk/sorts/merge_sort"

--
-- ==
-- entry: main
--
-- compiled input { 
-- [55.0f32, 62.5f32, 3.9f32, 3.7f32, 12.3f32] 
-- [1i32, 0i32, 4i32, 1i32, 1i32, 3i32, 0i32] 
-- [62.5f32, 3.0f32, 12.3f32, 3.3f32, 44.5f32, 0.9f32, 5.0f32] 
-- 
-- }
-- output { true }
-- 

type real = f32
type int  = i32
let real_min  = f32.min
let real_inf  = f32.inf
let real_rep  = 10000.0f32
let real_sqrt = f32.sqrt
let k   = 3i32
let dim = 5i32
let imA = [[55.0, 62.5, 3.8, 3.7, 69.3],[2.0, 3.3, 2.8, 28.7, 63.3],[24.0, 44.5, 3.9, 7.7, 2.3],[27.0, 4.1, 33.9, 6.6, 1.3],[32.0, 49.0, 45.9, 3.7, 12.3],[5.0, 82.9, 1.9, 3.9, 2.3],[3.0, 81.0, 1.0, 0.9, 2.3],[71.0, 62.5, 2.3, 59.7, 0.3],[0.2, 62.5, 2.4, 65.7, 0.3]]
let leaves = [([[27.0f32,  4.1f32,  33.9f32, 6.6f32,  1.3f32] , [24.0f32,  44.5f32, 3.9f32,  7.7f32,  2.3f32]] , [3i32,2i32]),([[32.0f32,  49.0f32, 45.9f32, 3.7f32,  12.3f32], [real_rep,real_rep,real_rep,real_rep,real_rep]], [4i32,100i32]),([[2.0f32,   3.3f32,  2.8f32,  28.7f32, 63.3f32], [real_rep,real_rep,real_rep,real_rep,real_rep]], [1i32,100i32]),([[55.0f32,  62.5f32, 3.8f32,  3.7f32,  69.3f32], [real_rep,real_rep,real_rep,real_rep,real_rep]], [0i32,100i32]),([[0.2f32,   62.5f32, 2.4f32,  65.7f32, 0.3f32] , [real_rep,real_rep,real_rep,real_rep,real_rep]], [8i32,100i32]),([[3.0f32,   81.0f32, 1.0f32,  0.9f32,  2.3f32] , [real_rep,real_rep,real_rep,real_rep,real_rep]], [6i32,100i32]),([[71.0f32,  62.5f32, 2.3f32,  59.7f32, 0.3f32] , [real_rep,real_rep,real_rep,real_rep,real_rep]], [7i32,100i32]),([[5.0f32,   82.9f32, 1.9f32,  3.9f32,  2.3f32] , [real_rep,real_rep,real_rep,real_rep,real_rep]], [5i32,100i32]) ]
let total_pat  = 9i32
let tree_depth = 4i32
let max_nodes  = 2i32 ** (tree_depth-1i32) - 1i32 -- 2^3-1 = 7
let fst_leaf   = 2i32 ** (tree_depth-1i32) - 1i32 -- 2^3-1 = 7
let patches_in_leaves = 2




let sqr_distance [n] (vct1 : [n]real) 
                     (vct2 : [n]real) : [n]real = 
    map2 (\p1 p2 -> (p1-p2)*(p1-p2)) vct1 vct2


let euclidean [n] (vct1 : [n]real) 
                  (vct2 : [n]real) : real =
    real_sqrt (reduce (+) 0.0 (sqr_distance vct1 vct2))


let kmin [m] (k : int) (dists : [m](int, real)) : [k](int, real) = 
    let fullarr = merge_sort_by_key (.1) (>=) dists 
    in  fullarr[0:k]


entry simple_traverse (query_patch: [dim]real) (split_dims: [max_nodes]int) (split_vals: [max_nodes]real) =
    let (bn, _) = loop (is_leaf,i) = (false, 0i32) while !is_leaf do
        if i >= fst_leaf -- we have a leaf
        then (true, i)
        else if query_patch[split_dims[i]] <= split_vals[i] -- left
             then (false, (i+1)*2-1)
             else (false, (i+1)*2) -- right
    in bn



-- let brute_force (patch_a: []real) (leaves_idx: int) (leaves: []([][]real, []int)) (best_neighbours: ([]real,[]int)) (k_neighbours: int) =
let brute_force (patch_a: []real) (leaves_idx: int) (leaves: []([][]real, []int)) (k_neighbours: int) =
    let all_dist_inds = map (\i ->
        let (b_candidates, b_indices) = unzip leaves in 
        let patch_cand = b_candidates[leaves_idx,i]
        let patch_indices = b_indices[leaves_idx,i]
        let dist = euclidean patch_a patch_cand
        in (dist,patch_indices)
        ) (iota patches_in_leaves)
    
    in kmin k_neighbours all_dist_inds



entry main (query_patch: [dim]real) (split_dims: [max_nodes]int) (split_vals: [max_nodes]real) =
    brute_force query_patch 2 leaves 1


    -- let (bn, _) = loop (is_leaf,i) = (false, 0i32) while !is_leaf do
    --     if i >= fst_leaf -- we have a leaf
    --     then (true, i)
    --     else if query_patch[split_dims[i]] <= split_vals[i] -- left
    --          then (false, (i+1)*2-1)
    --          else (false, (i+1)*2)
    -- in bn





-- let main(x: i32): i64 =
--   loop out = 0i64 for i < 32 do
--     let digit = (x >> (31-i)) & 1
--     let out = (out * 10i64) + i64.i32(digit)
--     in out


-- let get_spread =
--     let  = replicate k (-1i32, real_rep)
--         in loop nn for q < m do
--             let b_patch = imB[q]
--             let dist = euclidean a_patch b_patch
--             let b_idx = q in
--             let (_, _, nn') =
--                 loop (dist, b_idx, nn) for i < k do
--     map (\i ->
--         map (\offset -> 
--             reduce f32.min (f32.inf) flatten imA
--         ) (iota dim)
--     ) (iota total_pat)


-- def simple_traverse(query_patch, tree_depth, node_index, best_neighbours, leaves, split_values, split_dimensions, k_neighbours):
    
--     # if we have reached a leaf (here, (2 ** (tree_depth - 1)) - 1 corresponds to the max internal node index)
--     first_leaf  = (2 ** (tree_depth - 1)) - 1
--     max_items   = (2 ** tree_depth) - 2
--     node_index  = 0

--     while (node_index <= max_items):
--         if (node_index >= first_leaf): # a leaf
--             best_neighbours = brute_force(query_patch, node_index + 1 - (2 ** (tree_depth - 1)), leaves, best_neighbours, k_neighbours)
--             return best_neighbours

--         # else: go left
--         elif query_patch[split_dimensions[node_index]] <= split_values[node_index]:
--             # Go down one, append the other for backtracking
--             node_index  = (node_index+1)*2-1

--         # or go right
--         else:
--             # Go down one, append the other for backtracking
--             node_index  = (node_index+1)*2







