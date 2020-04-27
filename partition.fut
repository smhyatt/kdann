import "lib/github.com/diku-dk/sorts/merge_sort"
import "lib/github.com/diku-dk/sorts/radix_sort"
import "batch-merge-sort"
import "tree-construction"
import "traverse-tree"


-- ==
-- entry: main
--
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


let sortFinishedQueries (elm: i32) : bool = elm != (-1)


let partition2 [n][k] (expr: (i32 -> bool)) (leaf_idxs:         [n]i32)
                      (completed:   [n]i32) (knn_inds:          [n]i32)
                      (stack:       [n]i32) (knn_dsts: [n][k](i32,f32))
                      : (i32, [n]i32, [n]i32, [n]i32, [n][k](i32,f32), [n]i32) =

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
    let knn_inds'  = scatter (replicate n 0i32) inds knn_inds
    let knn_dsts'  = scatter2D (replicate n (replicate k (0i32, 0.0f32))) inds knn_dsts 
    let stackp     = scatter (replicate n 0i32) inds stack
    in  (trues, leaf_idxsp, completedp, knn_inds', knn_dsts', stackp)



--entry main [m][d] (k: i32) (h: i32) (imA : [m][d]f32) (imB : [m][d]f32) =
entry main [a][b][d] (k: i32) (h: i32) (imB : [b][d]f32) (imA : [a][d]f32) =
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
        in firstTraverse h median_dims q median_vals
      ) (iota a)


  let not_completed_queries = iota a
  let ongoing_knn   = replicate a (replicate k (-1i32, f32.inf))
  let completed_knn = copy ongoing_knn
  let stacks  = replicate a 0i32
  let STEP = 64
  let visited = replicate (num_leaves/STEP) (-1)

  let (_, _, _, completed_knn, _, _, visited, _) =
      loop (ncq, pre_leaf_idx, stacks, completed_knn, ongoing_knn, ongoing_knn_idxs, visited, i) =
        (not_completed_queries, init_leaves, stacks, completed_knn, ongoing_knn, iota a, visited, 0i32)
          while (length ncq) > 0 do

            let (new_ongoing_knns, new_leaves, new_stacks) =
                unzip3 <|
                map4 (\nqi lli st klst ->
                        let q = imA[nqi]
                        let lind = (lli-num_nodes)
                        let neighbours = bruteForce q leaves[lind] imB_idxs[lind] klst
                        let wknn = neighbours[k-1].1
                        let (new_l, new_s) = traverse h median_dims median_vals wknn q st lli lower_bounds upper_bounds
                        in (neighbours, new_l, new_s)
                     ) ncq pre_leaf_idx stacks ongoing_knn


            let (trues, ongoing_leaf_idxs, not_completed_queries', ongoing_knn_idxs', new_ongoing_knns', new_stacks') =
                partition2 sortFinishedQueries new_leaves ncq ongoing_knn_idxs new_stacks new_ongoing_knns


            let visited = if (i != 0) && ((i%STEP) == 0)
                          then let visited[i/STEP - 1] = trues in visited
                          else visited


            in (not_completed_queries'[:trues],
                ongoing_leaf_idxs[:trues],
                new_stacks'[:trues],
                scatter2Dtuples completed_knn ongoing_knn_idxs'[trues:] new_ongoing_knns'[trues:],
                new_ongoing_knns'[:trues],
                ongoing_knn_idxs'[:trues],
                visited,
                i+1)


  let (knn_inds, knn_vals) = map unzip completed_knn |> unzip
  in knn_vals
  -- in (knn_inds[:16], knn_vals[:16], visited)































