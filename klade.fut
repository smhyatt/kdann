--
-- ==
-- compiled input {
-- [55.0, 62.5, 3.9, 3.7, 12.3],
-- [1,0,4,1,1,3,0],
-- [62.5,3.0,12.3,3.3,44.5,0.9,5.0] }
-- output { true }
-- 

let imA = [[55.0, 62.5, 3.8, 3.7, 69.3],[2.0, 3.3, 2.8, 28.7, 63.3],[24.0, 44.5, 3.9, 7.7, 2.3],[27.0, 4.1, 33.9, 6.6, 1.3],[32.0, 49.0, 45.9, 3.7, 12.3],[5.0, 82.9, 1.9, 3.9, 2.3],[3.0, 81.0, 1.0, 0.9, 2.3],[71.0, 62.5, 2.3, 59.7, 0.3],[0.2, 62.5, 2.4, 65.7, 0.3]]
-- let flatA = flatten imA
let dim   = 5i32
let total_pat  = 9i32
let tree_depth = 4i32
let max_nodes  = (2i32 ** (tree_depth-1i32)) - 2i32 -- 2^3-2 = 6
let fst_leaf   = 2i32 ** (tree_depth-1i32) - 1i32



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



entry main (query_patch: [dim]f32) (split_vals: [max_nodes]f32) (split_dims: [max_nodes]i32) =
    let bn = false
    let node_idx   = 0i32
    let max_items  = (2i32 ** tree_depth) - 2i32
    let (bn, _, _) = loop (false, node_idx, max_items) while node_idx <= max_items do
        if node_idx >= fst_leaf -- we have a leaf
        then (true, node_idx, max_items)
        else if query_patch[split_dims[node_idx]] <= split_vals[node_idx] -- left
        then 
            let tmp = (node_idx+1)*2-1
            let node_idx = tmp
            (false, node_idx, max_items)
        else -- right
            let tmp = (node_idx+1)*2
            let node_idx = tmp
            (false, node_idx, max_items)
    in bn



