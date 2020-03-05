import "lib/github.com/diku-dk/sorts/merge_sort"

type real = f32
type int  = i32
let real_min  = f32.min
let real_inf  = f32.inf
let real_rep  = 10000.0f32
let real_sqrt = f32.sqrt
let k   = 3i32
let dim = 5i32
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


let brute_force (query_patch: []real) (leaves_idx: int) (leaves: []([][]real, []int)) (k_neighbours: int) =
    let all_dist_inds = map (\i ->
        let (candidates, indices) = unzip leaves in 
        let patch_cand = candidates[leaves_idx,i]
        let patch_idx  = indices[leaves_idx,i]
        let dist = euclidean query_patch patch_cand
        in (patch_idx, dist)
        ) (iota patches_in_leaves)
    
    in kmin k_neighbours all_dist_inds


let traverse (query_patch: [dim]real) (split_dims: [max_nodes]int) 
             (split_vals: [max_nodes]real) (leaves: []([][]real, []int)) 
             (best_neighbours: ([k]int, [k]real)) (k_neighbours: int) =

    let (bn, _) = loop (best,i) = (best_neighbours, 0i32) while i <= fst_leaf do
        if i >= fst_leaf -- we have a leaf
        then ((brute_force query_patch (i + 1 - (2 ** (tree_depth - 1))) leaves k_neighbours), i)
        else if query_patch[split_dims[i]] <= split_vals[i] -- left
             then (best_neighbours, (i+1)*2-1)
             else (best_neighbours, (i+1)*2) -- right
    in bn


entry main (query_patch: [dim]real) (split_dims: [max_nodes]int) (split_vals: [max_nodes]real) (k_neighbours: int) =
    let leaves = [([[27.0f32,  4.1f32,  33.9f32, 6.6f32,  1.3f32] , [24.0f32,  44.5f32, 3.9f32,  7.7f32,  2.3f32]] , [3i32,2i32]),([[32.0f32,  49.0f32, 45.9f32, 3.7f32,  12.3f32], [real_rep,real_rep,real_rep,real_rep,real_rep]], [4i32,100i32]),([[2.0f32,   3.3f32,  2.8f32,  28.7f32, 63.3f32], [real_rep,real_rep,real_rep,real_rep,real_rep]], [1i32,100i32]),([[55.0f32,  62.5f32, 3.8f32,  3.7f32,  69.3f32], [real_rep,real_rep,real_rep,real_rep,real_rep]], [0i32,100i32]),([[0.2f32,   62.5f32, 2.4f32,  65.7f32, 0.3f32] , [real_rep,real_rep,real_rep,real_rep,real_rep]], [8i32,100i32]),([[3.0f32,   81.0f32, 1.0f32,  0.9f32,  2.3f32] , [real_rep,real_rep,real_rep,real_rep,real_rep]], [6i32,100i32]),([[71.0f32,  62.5f32, 2.3f32,  59.7f32, 0.3f32] , [real_rep,real_rep,real_rep,real_rep,real_rep]], [7i32,100i32]),([[5.0f32,   82.9f32, 1.9f32,  3.9f32,  2.3f32] , [real_rep,real_rep,real_rep,real_rep,real_rep]], [5i32,100i32]) ]
    let best_neighbours = ([0i32], [real_inf])
    in traverse query_patch split_dims split_vals leaves best_neighbours k_neighbours


