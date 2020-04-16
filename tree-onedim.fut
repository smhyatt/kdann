import "lib/github.com/diku-dk/sorts/merge_sort"

-- ==
-- entry: main
--
-- compiled random input { [96]f32 }


entry main [m] (imB : [m]f32) =
    let h = 2i32                            -- 8i32 -- 15i32 -- height without leaves
    let num_nodes  = (1 << (h+1)) - 1
    let num_leaves =  1 << (h+1)
    let ppl = (m + num_nodes) / num_leaves  -- ceil(m / (2^(h+1)))
    let mp  = ppl * num_leaves
    let num_pads  = mp - m 
    -- let pad_limit = num_pads > num_leaves
    let pad = map (\_ -> f32.inf) (iota num_pads)
    let imB = imB ++ pad

    let (reference, median_vals) =
        loop(_, median_vals) = (replicate mp 0.0f32, replicate num_nodes 0.0f32)
        for level < (h+1) do
            let num_nodes_per_lvl = 1 << level |> trace
            let num_points_per_node_per_lvl = mp // num_nodes_per_lvl
      
            -- let (reference', dims, medians) = unzip3 <|
            let (reference, medians) = 
                unzip <|
                map (\i ->
                        let beg = num_points_per_node_per_lvl * i 
                        let end = beg + num_points_per_node_per_lvl - 1
                        let node_arr = imB[beg:end]
                        -- map (\k ->  reduce max on all points on dim k) (iota d)
                        -- dim = ...
                        -- sort node_arr according to the values on dimension dim
                        let node_arrp = merge_sort (f32.<=) node_arr
                        let median = node_arrp[num_points_per_node_per_lvl // 2]
                        in (node_arrp, median)
                    ) (iota num_nodes_per_lvl) |> trace

            let med_inds = map (\j -> (num_nodes_per_lvl-1) + j) (iota num_nodes_per_lvl)

            in (flatten reference, scatter median_vals med_inds medians)  
    
    in (reference, median_vals)
