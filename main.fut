import "lib/github.com/diku-dk/sorts/merge_sort"
import "lib/github.com/diku-dk/sorts/radix_sort"
import "batch-merge-sort"
import "tree-construction"
import "traverse-tree"


-- ==
-- entry: main
--
-- compiled input @ data/sorting/8test-k3-d9.in
-- compiled input @ data/sorting/8test-k11-d9.in
-- compiled input @ data/sorting/12test-k3-d9.in
-- compiled input @ data/sorting/12test-k11-d9.in



-- compiled input @ data/sorting/12test-k3-d16-eq.in
-- compiled input @ data/traverse/13test-k5-d6.in


-- compiled input @ data/sorting/8test-k3-d8.in


-- compiled input @ data/traverse/11test-k5-d16.in
-- compiled input @ data/traverse/11test-k5-d10.in
-- compiled input @ data/traverse/11test-k5-d1.in



-- compiled input @ data/brute/2brute2.in
-- compiled input @ data/brute/4brute2.in
-- compiled input @ data/brute/6brute2.in
-- compiled input @ data/brute/8brute2.in
-- compiled input @ data/brute/10brute2.in
-- compiled input @ data/brute/12brute2.in
-- compiled input @ data/brute/14brute2.in
-- compiled input @ data/brute/2brute6.in
-- compiled input @ data/brute/4brute6.in
-- compiled input @ data/brute/6brute6.in
-- compiled input @ data/brute/8brute6.in
-- compiled input @ data/brute/10brute6.in
-- compiled input @ data/brute/12brute6.in
-- compiled input @ data/brute/14brute6.in
-- compiled input @ data/brute/2brute12.in
-- compiled input @ data/brute/4brute12.in
-- compiled input @ data/brute/6brute12.in
-- compiled input @ data/brute/8brute12.in
-- compiled input @ data/brute/10brute12.in
-- compiled input @ data/brute/12brute12.in
-- compiled input @ data/brute/14brute12.in



-- compiled input @ data/sorting/8test-k3-d11.in
-- compiled input @ data/sorting/8test-k3-d12.in
-- compiled input @ data/sorting/8test-k3-d13.in
-- compiled input @ data/sorting/8test-k3-d14.in
-- compiled input @ data/sorting/8test-k3-d15.in


-- break even partition test
-- compiled input @ data/sorting/8test-k3-d10.in
-- compiled input @ data/sorting/8test-k3-d9.in
-- compiled input @ data/sorting/8test-k3-d8.in
-- compiled input @ data/sorting/8test-k3-d7.in
-- compiled input @ data/sorting/8test-k3-d6.in
-- compiled input @ data/sorting/8test-k3-d5.in


-- Brute force 
-- compiled input @ data/brute/10test-k3-d4.in
-- compiled input @ data/brute/10test-k3-d8.in
-- compiled input @ data/brute/10test-k7-d4.in
-- compiled input @ data/brute/10test-k7-d8.in
-- compiled input @ data/brute/10test-k3-d4-eq.in
-- compiled input @ data/brute/10test-k3-d8-eq.in
-- compiled input @ data/brute/10test-k7-d4-eq.in
-- compiled input @ data/brute/10test-k7-d8-eq.in
-- compiled input @ data/brute/13test-k3-d4.in
-- compiled input @ data/brute/13test-k3-d8.in
-- compiled input @ data/brute/13test-k7-d4.in
-- compiled input @ data/brute/13test-k7-d8.in
-- compiled input @ data/brute/13test-k3-d4-eq.in
-- compiled input @ data/brute/13test-k3-d8-eq.in
-- compiled input @ data/brute/13test-k7-d4-eq.in
-- compiled input @ data/brute/13test-k7-d8-eq.in




-- Partition vs. sorting
-- compiled input @ data/sorting/8test-k3-d4.in
-- compiled input @ data/sorting/8test-k3-d16.in
-- compiled input @ data/sorting/8test-k11-d4.in
-- compiled input @ data/sorting/8test-k11-d16.in
-- compiled input @ data/sorting/8test-k3-d4-eq.in
-- compiled input @ data/sorting/8test-k3-d16-eq.in
-- compiled input @ data/sorting/8test-k11-d4-eq.in
-- compiled input @ data/sorting/8test-k11-d16-eq.in
-- compiled input @ data/sorting/12test-k3-d4.in
-- compiled input @ data/sorting/12test-k3-d16.in
-- compiled input @ data/sorting/12test-k11-d4.in
-- compiled input @ data/sorting/12test-k11-d16.in
-- compiled input @ data/sorting/12test-k3-d4-eq.in
-- compiled input @ data/sorting/12test-k3-d16-eq.in
-- compiled input @ data/sorting/12test-k11-d4-eq.in
-- compiled input @ data/sorting/12test-k11-d16-eq.in



-- Old Traversal
-- compiled input @ data/traverse/11test-k1-d1.in
-- compiled input @ data/traverse/11test-k1-d6.in
-- compiled input @ data/traverse/11test-k1-d16.in
-- compiled input @ data/traverse/11test-k5-d1.in
-- compiled input @ data/traverse/11test-k5-d6.in
-- compiled input @ data/traverse/11test-k5-d16.in
-- compiled input @ data/traverse/11test-k17-d1.in
-- compiled input @ data/traverse/11test-k17-d6.in
-- compiled input @ data/traverse/11test-k17-d16.in
-- compiled input @ data/traverse/13test-k1-d1.in
-- compiled input @ data/traverse/13test-k1-d6.in
-- compiled input @ data/traverse/13test-k1-d16.in
-- compiled input @ data/traverse/13test-k5-d1.in
-- compiled input @ data/traverse/13test-k5-d6.in
-- compiled input @ data/traverse/13test-k5-d16.in
-- compiled input @ data/traverse/13test-k17-d1.in
-- compiled input @ data/traverse/13test-k17-d6.in
-- compiled input @ data/traverse/13test-k17-d16.in


-- New Traversal
-- compiled input @ data/traverse/11test-k1-d1.in
-- compiled input @ data/traverse/11test-k1-d6.in
-- compiled input @ data/traverse/11test-k1-d10.in
-- compiled input @ data/traverse/11test-k5-d1.in
-- compiled input @ data/traverse/11test-k5-d6.in
-- compiled input @ data/traverse/11test-k5-d10.in
-- compiled input @ data/traverse/11test-k17-d1.in
-- compiled input @ data/traverse/11test-k17-d6.in
-- compiled input @ data/traverse/11test-k17-d10.in
-- compiled input @ data/traverse/13test-k1-d1.in
-- compiled input @ data/traverse/13test-k1-d6.in
-- compiled input @ data/traverse/13test-k1-d10.in
-- compiled input @ data/traverse/13test-k5-d1.in
-- compiled input @ data/traverse/13test-k5-d6.in
-- compiled input @ data/traverse/13test-k5-d10.in
-- compiled input @ data/traverse/13test-k17-d1.in
-- compiled input @ data/traverse/13test-k17-d6.in
-- compiled input @ data/traverse/13test-k17-d10.in



-- compiled input @ data/testinput.in
-- output @ data/validation.out
--


--           h+1
-- 100000    9     195,3125      9   131072    256
-- 400000    11    195,3125      11  524288    256
-- 800000    12    195,3125      12  1048576   256
-- 1200000   13    146,484375    13  2097152   256
-- 1600000   12    195,3125      12  1048576   256
-- 2000000   13    244,140625    13  2097152   256
-- 4000000   14    244,140625    14  4194304   256



let seqEuclidean [n] (vct1: [n]f32) (vct2: [n]f32) : f32 =
    let dist = loop dist = 0.0f32
      for i < n do
          let q = vct1[i]
          let p = vct2[i]
          in ((q-p)*(q-p) + dist)
    in (f32.sqrt dist)


let bruteForce [n][k][d] (q: [d]f32) (leaves: [n][d]f32) (leaf_idxs: [n]i32)
                         (current_knn:     [k](i32,f32)) : [k](i32,f32) =
    if q[0] >= f32.highest
    then copy current_knn
    else
        let nn = copy current_knn
        in loop nn for p < n do
            let patch = leaves[p]
            let dist  = seqEuclidean q patch
            let idx   = leaf_idxs[p]
            let worst = nn[(k-1)].1 in
            if dist <= worst then
                let (_, _, nnp) =
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
            else nn



let scatter2Dtuples [m][k][n] (arr2D: *[m][k](i32,f32)) (qinds: [n]i32) (vals2D: [n][k](i32,f32)) : *[m][k](i32,f32) =
  let nk = n*k
  let flat_qinds = map (\i -> let (d,r) = (i / k, i % k)
                              in qinds[d]*k + r
                       ) (iota nk)
  let res1D = scatter (flatten arr2D) flat_qinds ((flatten vals2D) :> [nk](i32,f32))
  in  unflatten m k res1D


let gather2Dtuples (idx_lst: []i32) (val_lst: [][](i32,f32)) : [][](i32,f32) =
    map (\ind -> map (\(i,d) -> (i,d)) (val_lst[ind])) idx_lst



let sortQueriesByLeaves [n] (leaves: [n]i32) : ([n]i32, [n]i32) =
  unzip <| merge_sort 
                (\ (v1,i1) (v2,i2) -> 
                    if v1 < v2 then true  else
                    if v1 > v2 then false else i1 <= i2 )
                (zip leaves (iota n))




entry main [a][b][d] (k: i32) (h: i32) (imA : [b][d]f32) (imB : [a][d]f32) =
  let num_nodes  = (1 << (h+1)) - 1
  let num_leaves =  1 << (h+1)
  let tot_nodes  = num_nodes+num_leaves


  -- build the tree of image B
  let (imB_idxs, leaves, median_vals, median_dims, lower_bounds, upper_bounds, ppl) = buildTree imB h

  let leaves       = leaves       :> [num_leaves][ppl][d]f32
  let imB_idxs     = imB_idxs     :> [num_leaves][ppl]i32
  let median_dims  = median_dims  :> [num_nodes]i32
  let median_vals  = median_vals  :> [num_nodes]f32
  let lower_bounds = lower_bounds :> [tot_nodes][d]f32
  let upper_bounds = upper_bounds :> [tot_nodes][d]f32



  let init_leaves =
      map (\ai ->
        let q = imA[ai]
        -- in firstTraverse h (median_dims :> [num_nodes]i32) q (median_vals :> [num_nodes]f32)
        in firstTraverse h median_dims q median_vals
      ) (iota a)

  let (sorted_idxs_fst, init_leaves) = zip (iota a) init_leaves |> merge_sort_by_key (.1) (<=) |> unzip 
  -- let (sorted_idxs_fst, ongoing_leaf_idxs_fst) = zip (iota m) init_leaves |> merge_sort_by_key (.1) (<=) |> unzip -- radix_sort_int_by_key (.1) i32.num_bits i32.get_bit |> unzip
  -- let not_completed_queries = gather sorted_idxs_fst (iota m)
  let not_completed_queries = gather2D sorted_idxs_fst imA

  let ongoing_knn   = replicate a (replicate k (-1i32, f32.inf))
  let completed_knn = copy ongoing_knn
  let stacks  = replicate a 0i32
  let STEP = 1
  let visited = replicate (num_leaves/STEP) (-1)
  -- let visited = replicate (num_leaves+1) (-1)

  let (_, _, _, completed_knn, _, _, visited, _, _) =
      loop (ncq, pre_leaf_idx, stacks, completed_knn, ongoing_knn, ongoing_knn_idxs, visited, i, trues) =
        (not_completed_queries, init_leaves, stacks, completed_knn, ongoing_knn, sorted_idxs_fst, visited, 0i32, a)
          while (length ncq) > 0 do

            let (new_ongoing_knns, new_leaves, new_stacks) =
                unzip3 <|
                map4 (\q lli st klst ->
                        let lind = (lli-num_nodes)
                        let neighbours = bruteForce q leaves[lind] imB_idxs[lind] klst
                        let wknn = neighbours[k-1].1
                        let (new_l, new_s) = traverse h median_dims median_vals wknn q st lli lower_bounds upper_bounds
                        in (neighbours, new_l, new_s)
                     ) ncq pre_leaf_idx stacks ongoing_knn

            let (ongoing_leaf_idxs, sorted_idxs) = sortQueriesByLeaves new_leaves
            let finished = map (\ll -> if ll == -1 then 1 else 0) ongoing_leaf_idxs |> reduce (+) 0
            let trues' = trues - finished

            let not_completed_queries' = gather2D sorted_idxs ncq
            let ongoing_knn_idxs' = gather sorted_idxs ongoing_knn_idxs
            let new_ongoing_knns' = gather2Dtuples sorted_idxs new_ongoing_knns
            let new_stacks' = gather sorted_idxs new_stacks

            let visited = if (i != 0) && ((i%STEP) == 0)
                          then let visited[i/STEP - 1] = trues' in visited
                          else visited

            in (not_completed_queries'[finished:],
                ongoing_leaf_idxs[finished:],
                new_stacks'[finished:],
                scatter2Dtuples completed_knn ongoing_knn_idxs'[:finished] new_ongoing_knns'[:finished],
                new_ongoing_knns'[finished:],
                ongoing_knn_idxs'[finished:],
                visited, -- scatter visited [i] [trues'],
                i+1,
                trues')


  -- let with_query_idxs = zip (iota m :> [m]i32) (completed_knn :> [m][k](i32,f32))
  let (knn_inds, knn_vals) = map unzip completed_knn |> unzip
  in visited
  -- in knn_vals
  -- in (knn_inds[:16], knn_vals[:16], visited)
  -- in (completed_knn, visited, with_query_idxs, lower_bounds, upper_bounds)
  -- in (completed_knn[:10], visited[:200], with_query_idxs[:10])--, lower_bounds, upper_bounds)































