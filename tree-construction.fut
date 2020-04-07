import "batch-merge-sort"

-- ==
-- entry: buildTree
--

let scatter2D [m][k][n] 't (arr2D: *[m][k]t) (qinds: [n]i32) (vals2D: [n][k]t) : *[m][k]t =
  let nk = n*k
  let flat_qinds = map (\i -> let (d,r) = (i / k, i % k)
                              in qinds[d]*k + r
                       ) (iota nk)
  let res1D = scatter (flatten arr2D) flat_qinds ((flatten vals2D) :> [nk]t)
  in  unflatten m k res1D



let gather2D (idx_lst: []i32) (val_lst: [][]f32) : [][]f32 =
    map (\ind -> map (\x -> x) (val_lst[ind])) idx_lst


let gather (idx_lst: []i32) (val_lst: []i32) : []i32 =
    map (\x -> val_lst[x]) idx_lst




let lessThan   (x: f32) (y: f32) = x <= y && x != f32.inf && y != f32.inf
let largerThan (x: f32) (y: f32) = x >  y && x != f32.inf && y != f32.inf

let getEdge (lsts : [][]f32) (expr : (f32 -> f32 -> bool)) =
      map (\lst ->
          reduce_comm (\x y -> if expr x y
                               then x
                               else y
                      ) lst[0] lst
          ) lsts



entry buildTree [m][d] (imB : [m][d]f32) (h: i32) =
    let num_nodes  = (1 << (h+1)) - 1
    let num_leaves =  1 << (h+1)
    let ppl  = (m + num_nodes) / num_leaves  -- ceil(m / (2^(h+1)))
    let m'   = ppl * num_leaves
    let num_pads = m' - m
    let pad = map (\_ -> map (\_ -> f32.inf) (iota d)) (iota num_pads)
    let imB = imB ++ pad
    let num_patches_in_leaf = m' // num_leaves
    let tot_nodes = num_nodes+num_leaves

    let (imB_idxs, leaves, median_vals, median_dims, lower_bounds, upper_bounds) =
        loop(imB_idxs, reference, median_vals, median_dims, lower_bounds, upper_bounds) =
          (iota m', imB, replicate num_nodes 0.0f32, replicate num_nodes 0i32, 
            replicate tot_nodes (replicate d 0.0f32), replicate tot_nodes (replicate d 0.0f32))
        for level < (h+1) do
            let num_nodes_per_lvl = 1 << level
            let num_points_per_node_per_lvl = m' // num_nodes_per_lvl
            let referencep = unflatten num_nodes_per_lvl num_points_per_node_per_lvl reference
            let imB_inds   = unflatten num_nodes_per_lvl num_points_per_node_per_lvl imB_idxs

            let (dims, work_dims, lower, upper) = unzip4 <|
                map (\node_arr ->
                        let dim_arrs = transpose node_arr    |> intrinsics.opaque
                        let mini = getEdge dim_arrs lessThan |> intrinsics.opaque
                        let maxi = getEdge dim_arrs largerThan
                        -- getting the widest spread
                        let diffs   = map (\di -> maxi[di]-mini[di]) (iota d)
                        let (dim,_) = reduce_comm (\(i1,v1) (i2,v2) -> if v1>v2
                                                                       then (i1,v1)
                                                                       else (i2,v2))
                                                  ((-1),(-f32.inf)) <| zip (iota d) diffs
                        let work_dim = map (\x -> (x, copy node_arr[x,dim])
                                           ) (iota num_points_per_node_per_lvl)
                        in (dim, work_dim, mini, maxi)
                      ) referencep

            let (d_sort_idxs_2d, _) = 
                          work_dims
                          |> batch_merge_sort (num_points_per_node_per_lvl, f32.inf)
                                              (\ (i1,v1) (i2,v2) -> 
                                                  if v1 < v2 then true  else
                                                  if v1 > v2 then false else i1 <= i2 )
                          |> map unzip |> unzip

            let (imB_idxs', reference, medians) = unzip3 <|
                map4 (\node_arr inds d_sort_idxs dim ->
                        let im_indices  = gather d_sort_idxs inds
                        let node_arrp   = gather2D d_sort_idxs node_arr
                        let median      = node_arrp[num_points_per_node_per_lvl // 2, dim]
                        in (im_indices, node_arrp, median)

                ) referencep imB_inds d_sort_idxs_2d dims


            let med_inds = map (\j -> (num_nodes_per_lvl-1) + j) (iota num_nodes_per_lvl)
            in (flatten imB_idxs',
                flatten reference,
                scatter median_vals med_inds medians,
                scatter median_dims med_inds dims,
                scatter2D lower_bounds med_inds lower,
                scatter2D upper_bounds med_inds upper)

    let leaves'   = unflatten num_leaves num_patches_in_leaf leaves
    let imB_idxs' = unflatten num_leaves num_patches_in_leaf imB_idxs

    let (lower, upper) = unzip <|
        map (\node_arr ->
              let dim_arrs = transpose node_arr    |> intrinsics.opaque
              let mini = getEdge dim_arrs lessThan |> intrinsics.opaque
              let maxi = getEdge dim_arrs largerThan
              in (mini, maxi)
            ) leaves'

    let new_bound_idxs = map (\j -> (j + num_nodes)) (iota num_leaves)

    in ((imB_idxs'   :> [num_leaves][ppl]i32),
        (leaves'     :> [num_leaves][ppl][d]f32),
        (median_vals :> [num_nodes]f32),
        (median_dims :> [num_nodes]i32),
        (scatter2D lower_bounds new_bound_idxs lower :> [tot_nodes][d]f32),
        (scatter2D upper_bounds new_bound_idxs upper :> [tot_nodes][d]f32),
        ppl)







































