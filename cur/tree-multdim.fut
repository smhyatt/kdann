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
                        let diffs = map (\di -> maxi[di]-mini[di]) (iota (length maxi))
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
