import "lib/github.com/diku-dk/sorts/merge_sort"

--
-- ==
-- entry: main
--
-- compiled input { 
--  [55.0f32, 62.5f32, 3.9f32, 3.7f32, 12.3f32]
--  [1i32, 0i32, 4i32, 1i32, 1i32, 3i32, 0i32]
--  [62.5f32, 3.0f32, 12.3f32, 3.3f32, 44.5f32, 0.9f32, 5.0f32]
--  1i32
--  true
-- }
-- auto output
-- 

type real = f32
type int  = i32
let real_min  = f32.min
let real_inf  = f32.inf
let real_rep  = 10000.0f32
let real_sqrt = f32.sqrt
let k   = 3i32
let dim = 5i32
let total_pat  = 9i32
let tree_depth = 4i32
let max_nodes  = 2i32 ** (tree_depth-1i32) - 1i32 -- 2^3-1 = 7
let fst_leaf   = 2i32 ** (tree_depth-1i32) - 1i32 -- 2^3-1 = 7
let patches_in_leaves = 2i32




let sqr_distance [n] (vct1 : [n]real) 
                     (vct2 : [n]real) : [n]real = 
    map2 (\p1 p2 -> (p1-p2)*(p1-p2)) vct1 vct2


let euclidean [n] (vct1 : [n]real) 
                  (vct2 : [n]real) : real =
    real_sqrt (reduce (+) 0.0 (sqr_distance vct1 vct2))


let kmin [m] (k : int) (dists : [m](int, real)) : ([k]int, [k]real) = 
    let fullarr = merge_sort_by_key (.1) (<=) dists 
    in  unzip fullarr[0:k]

let kmin2 [m] (k : int) (dists : [m]real) = --: ([k]int, [k]real) = 
    let fullarr = merge_sort (f32.<=) dists
    in  fullarr[0:k]


-- let is_odd (e: i32) : bool = (e & 1) == 1

let is_odd (e: int) : int = if (e & 1) == 1 then 1 else -1


-- let brute_force (patch_a: []real) (leaves_idx: int) (leaves: []([][]real, []int)) (best_neighbours: ([]real,[]int)) (k_neighbours: int) =
    -- in kmin k_neighbours all_dist_inds


-- let brute_force (query_patch: []real) (leaves_idx: int) (leaves: []([][]real, []int))
--                 (bn_indices: [k]int) (bn_dists: [k]real) = 

--     let all_dist_inds = map (\i ->
--         let (candidates, indices) = unzip leaves in 
--         let patch_cand = candidates[leaves_idx,i]
--         let patch_idx  = indices[leaves_idx,i]
--         let dist = euclidean query_patch patch_cand
--         in (patch_idx, dist)
--         ) (iota patches_in_leaves)
    
--     in all_dist_inds


let brute_force (query_patch: []real) (leaves_idx: int) (leaves: []([][]real, []int))
                (best_neighbours: ([]int, []real)) (k_neighbours: int) = 

    let (bn') =
        loop (best) for patch < patches_in_leaves do
            let (candidates, indices) = unzip leaves in 
            let patch_cand = candidates[leaves_idx, patch]
            let patch_idx  = indices[leaves_idx, patch]
            let dist = euclidean query_patch patch_cand in
            let (_, _, bn) =
                loop (patch_idx, dist, best_neighbours) for i < k_neighbours do
                    let cur_bn = bn[i].1  in
                    if dist <= cur_bn then 
                        let tmp_i = best_neighbours[i].0  --cur_idx
                        let best_neighbours[i] = (patch_idx, dist) -- let nn' = nn with [i] <- dist in ... nn
                        let patch_idx = tmp_i
                        let dist  = cur_bn
                        in  (dist, patch_idx, best_neighbours)
                    else    (dist, patch_idx, best_neighbours)
            in  bn
    in bn'




let traverse (query_patch: [dim]real) (split_dims: [max_nodes]int) (split_vals: [max_nodes]real) 
             (path: i32) (best_neighbours: ([]int, []real)) (k_neighbours: int) (leaves: []([][]real, []int)) (backtracking: bool) =

    let (bn, node, route, bn') = 
        loop (is_leaf,i,p,bn) = (false,0i32,path,best_neighbours) while !is_leaf do
        if i >= fst_leaf -- we have a leaf
        then
            let leaves_idx = (i + 1 - (2 ** (tree_depth - 1)))
            let get_leaf = brute_force query_patch leaves_idx leaves best_neighbours k_neighbours in
            (true, i, p, bn)
            if backtracking == true
            then let extra_leaf  = (is_odd idx) + leaves_idx
                 
        else if query_patch[split_dims[i]] <= split_vals[i] -- left
             then 
                let left = (i+1)*2-1 in
                (false, left, (1 << left | p), bn)
             else 
                let right = (i+1)*2 in
                (false, right, (1 << right | p), bn) -- right
    in (bn, node, route, bn')



entry main (query_patch: [dim]real) (split_dims: [max_nodes]int) (split_vals: [max_nodes]real) 
           (k_neighbours: int) (backtracking: bool) =
    let leaves = [([[27.0f32,  4.1f32,  33.9f32, 6.6f32,  1.3f32] , [24.0f32,  44.5f32, 3.9f32,  7.7f32,  2.3f32]] , [3i32,2i32]),([[32.0f32,  49.0f32, 45.9f32, 3.7f32,  12.3f32], [real_rep,real_rep,real_rep,real_rep,real_rep]], [4i32,100i32]),([[2.0f32,   3.3f32,  2.8f32,  28.7f32, 63.3f32], [real_rep,real_rep,real_rep,real_rep,real_rep]], [1i32,100i32]),([[55.0f32,  62.5f32, 3.8f32,  3.7f32,  69.3f32], [real_rep,real_rep,real_rep,real_rep,real_rep]], [0i32,100i32]),([[0.2f32,   62.5f32, 2.4f32,  65.7f32, 0.3f32] , [real_rep,real_rep,real_rep,real_rep,real_rep]], [8i32,100i32]),([[3.0f32,   81.0f32, 1.0f32,  0.9f32,  2.3f32] , [real_rep,real_rep,real_rep,real_rep,real_rep]], [6i32,100i32]),([[71.0f32,  62.5f32, 2.3f32,  59.7f32, 0.3f32] , [real_rep,real_rep,real_rep,real_rep,real_rep]], [7i32,100i32]),([[5.0f32,   82.9f32, 1.9f32,  3.9f32,  2.3f32] , [real_rep,real_rep,real_rep,real_rep,real_rep]], [5i32,100i32]) ]
    let path = 0i32
    -- let bn_indices = replicate k (-1i32)
    -- let bn_dists   = replicate k (real_inf)
    let best_neighbours = replicate k (-1i32, real_inf)
    let (is_leaf, idx, path, best_neighbours) = traverse query_patch split_dims split_vals path best_neighbours k_neighbours leaves backtracking
    in if is_leaf == true
    then if backtracking == true -- LAV BACKTRACKING HER
         then 
            -- let parent = floor ((idx-1)/2)
            let extra_leaf  = (is_odd idx) + (idx + 1 - (2 ** (tree_depth - 1)))
            let both_leaves = (brute_force query_patch (idx + 1 - (2 ** (tree_depth - 1))) leaves) 
                              ++ (brute_force query_patch extra_leaf leaves) 
            in kmin k_neighbours both_leaves
         else kmin k_neighbours (brute_force query_patch (idx + 1 - (2 ** (tree_depth - 1))) leaves)
    else ([-1i32], [real_inf])



























