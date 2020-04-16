import "lib/github.com/diku-dk/sorts/merge_sort"

-- ==
-- entry: main
--
-- compiled random input { [96][3]f32 }


let scatter2D [r] (idx_lst:[r]i32) (val_lst:[r][]f32): [r][]f32 =
    map (\i ->
            let new_idx  = copy idx_lst[i]
            in val_lst[new_idx]
        ) (iota r)


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
    -- loop(reference, median_vals, median_dims) = (iota m, replicate num_nodes 0.0f32, replicate num_nodes 0)
    -- let (reference, median_vals) =

    let (reference, median_vals, median_dims) =
        loop(_, median_vals, median_dims) = 
          (replicate mp inner_dims, replicate num_nodes 0.0f32, replicate num_nodes 0i32)
        for level < (h+1) do
            let num_nodes_per_lvl = 1 << level
            let num_points_per_node_per_lvl = mp // num_nodes_per_lvl |> trace
      
            let (reference, medians, dims) = 
                unzip3 <|
                map (\i ->
                        let beg = num_points_per_node_per_lvl * i 
                        let end = beg + num_points_per_node_per_lvl - 1
                        let node_arr = imB[beg:end]
                        let leaf_len = length node_arr |> trace
                        let dim_arrs = 
                            map (\k -> map (\w -> copy node_arr[w,k]) (iota leaf_len)) (iota d)
                        let diffs = map (\q -> 
                                            let maxi = reduce f32.max (-f32.inf) dim_arrs[q]
                                            let mini = reduce f32.min f32.inf    dim_arrs[q]
                                            in maxi-mini
                                        ) (iota leaf_len)
                        let big = reduce f32.max (-f32.inf) diffs 
                        let dim = map (\ix -> if big == diffs[ix] then ix else 0) (iota leaf_len) |> reduce (+) 0
                        let work_dim = map (\x -> (x, copy node_arr[x,dim]) ) (iota leaf_len)
                        let d_sort_idxs = work_dim |> merge_sort_by_key (.1) (<=) |> map (.0)
                        let node_arrp = scatter2D d_sort_idxs node_arr
                        let median = node_arrp[num_points_per_node_per_lvl // 2]
                        in (node_arrp, median, dim)
                    ) (iota num_nodes_per_lvl) |> trace

            let med_inds = map (\j -> (num_nodes_per_lvl-1) + j) (iota num_nodes_per_lvl)

            in (flatten reference, scatter median_vals med_inds medians, scatter median_dims med_inds dims)
    
    in (reference, median_vals, median_dims)
            -- in (scatter reference ref_inds referencepp, scatter median_vals med_inds medians)
        -- (scatter median_dims inds dims, scatter median_vals inds medians)


-- let median = node_arrp[leaf_len // 2]
-- [147]> let work_dim = map (\x -> (x, copy node_arr[x,dim]) ) (iota leaf_len)
-- [148]> work_dim
-- [(0i32, 8.475803f32), (1i32, 1.4399022f32), (2i32, 0.65261006f32)]
-- let d_sort = [(2i32, 0.65261006f32), (1i32, 1.4399022f32), (0i32, 8.475803f32)]
-- let d_sort_idxs = work_dim |> merge_sort_by_key (.1) (<=) |> map (.1)
-- let d_sort_idxs = [2i32, 1i32, 0i32]
-- let node_arrp = scatter2D d_sort_idxs node_arr

-- scatter2D node_arrp d_sort_idxs node_arr

-- ellers skal jeg hive alle elementerne ud fra den
-- specifikke dimension og så tilføje et index i en
-- (,) og så lave merge_sort_by_key og få en integer
-- liste ud med med den nye rækkefølge og så flytte
-- dem rundt i den rækkefølge med scatter


-- let diffs = map (\q -> 
--                                             let maxi = reduce f32.max (-f32.inf) dim_arrs[q]
--                                             let mini = reduce f32.min f32.inf    dim_arrs[q]
--                                             in (q, maxi-mini)
--                                         ) (iota leaf_len)

-- let (ws,_) = reduce (\ (i1,v1) (i2,v2) -> if v1>v2 then (i1,v1) else (i2,v2) ) ((-1),(-f32.inf)) diffs


-- ppl = ceil ( m / (2^(h+1)) )
-- m' = ppl*(1<<(h+1))
-- m' - m
-- num_pads = m' - m 
-- num_pads > num_leaves


-- imB ++ [Inf, Inf, Inf ...]


-- loop(reference, median_vals, median_dims) = (iota n, replicate num_nodes 0, replicate num_nodes 0)
-- for level = 0; level < h+1; level++

--   num_points_per_node_per_lvl = m' / (1 << level)
  
--   map (\i -> let ...
--         beg = num_points_per_node_per_lvl * i 
--         end = beg + num_points_per_node_per_lvl - 1

--           ) (iota 2^lev)


-- let node_arr = reference[beg:end]

-- 1. reduce min ...

-- 2. reduce max ...

-- map (\k ->  reduce max on all points on dim k) (iota d)

-- dim = ...

-- sort node_arr according to the values on dimension dim

-- median = node_arr'[num_points_per_node_per_lvl / 2]

-- the map returns

-- (node_arr', dim, median)

-- let (reference', dims, medians) = unzip3 <|
--     map (\i -> let ...
--         ) (iota 2^lev)


-- let reference'' = flatten reference'

-- let inds = map (\i -> (1 << level)-1  +  i  ) (iota (1 << level))

-- scatter median_dims inds dims


































