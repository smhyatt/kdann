--
-- ==
-- entry: nnk nnk_sort
--
-- compiled input { [55.0f32, 62.5f32, 3.9f32, 3.7f32, 12.3f32] [1i32, 0i32, 4i32, 1i32, 1i32, 3i32, 0i32] [62.5f32, 3.0f32, 12.3f32, 3.3f32, 44.5f32, 0.9f32, 5.0f32] }
-- output { true }
-- 

let imA = [[55.0, 62.5, 3.8, 3.7, 69.3],[2.0, 3.3, 2.8, 28.7, 63.3],[24.0, 44.5, 3.9, 7.7, 2.3],[27.0, 4.1, 33.9, 6.6, 1.3],[32.0, 49.0, 45.9, 3.7, 12.3],[5.0, 82.9, 1.9, 3.9, 2.3],[3.0, 81.0, 1.0, 0.9, 2.3],[71.0, 62.5, 2.3, 59.7, 0.3],[0.2, 62.5, 2.4, 65.7, 0.3]]
let dim   = 5i32
let total_pat  = 9i32
let tree_depth = 4i32
let max_nodes  = (2i32 ** (tree_depth-1i32)) - 1i32 -- 2^3-1 = 7
let fst_leaf   = 2i32 ** (tree_depth-1i32) - 1i32

entry main (query_patch: [dim]f32) (split_dims: [max_nodes]i32) (split_vals: [max_nodes]f32) =
    let bn = false
    let node_idx   = 0i32
    let max_items  = (2**4)-2 in
    let (bn, _) = loop (is_leaf,i) = (false, node_idx) while i <= max_items do
        if i >= fst_leaf -- we have a leaf
        then (true, i)
        else if query_patch[split_dims[i]] <= split_vals[i] -- left
             then (false, (i+1)*2-1)
             else (false, (i+1)*2)
    in bn





-- let main(x: i32): i64 =
--   loop out = 0i64 for i < 32 do
--     let digit = (x >> (31-i)) & 1
--     let out = (out * 10i64) + i64.i32(digit)
--     in out


-- let get_spread =
--     let  = replicate k (-1i32, real_inf)
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







