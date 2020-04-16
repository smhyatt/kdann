-- ==
-- entry: main
--
-- compiled random input { [96]f32 }


-----------------------
--- Parallel Filter ---
-----------------------
let partition2 [n] 't (conds: [n]bool) (dummy: t) (arr: [n]t) : (i32, [n]t) =
  let tflgs = map (\ c -> if c then 1 else 0) conds
  let fflgs = map (\ b -> 1 - b) tflgs

  let indsT = scan (+) 0 tflgs
  let tmp   = scan (+) 0 fflgs
  let lst   = if n > 0 then indsT[n-1] else -1
  let indsF = map (+lst) tmp

  let inds  = map3 (\ c indT indF -> if c then indT-1 else indF-1) conds indsT indsF

  let fltarr= scatter (replicate n dummy) inds arr
  in  (lst, fltarr)


---------------------
--- SgmSumInt     ---
---------------------
-- 2. sgmSumInt on integers, i.e., sgmIncScan (+) 0
let sgmSumInt [n] (flg : [n]i32) (arr : [n]i32) : [n]i32 =
  let flgs_vals =
    scan ( \ (f1, x1) (f2,x2) ->
            let f = f1 | f2 in
            if f2 > 0 then (f, x2)
            else (f, x1 + x2) )
         (0,0) (zip flg arr)
  let (_, vals) = unzip flgs_vals
  in vals

---------------------
--- MkFlags Array ---
---------------------

let mkFlagArray 't [m]
            (aoa_shp: [m]i32) (zero: t)       --aoa_shp=[0,3,1,0,4,2,0]
            (aoa_val: [m]t  ) : []t = unsafe  --aoa_val=[1,1,1,1,1,1,1]
  let shp_rot = map (\i->if i==0 then 0       --shp_rot=[0,0,3,1,0,4,2]
                         else aoa_shp[i-1]
                    ) (iota m)
  let shp_scn = scan (+) 0 shp_rot            --shp_scn=[0,0,3,4,4,8,10]
  let aoa_len = shp_scn[m-1]+aoa_shp[m-1]     --aoa_len= 10
  let shp_ind = map2 (\shp ind ->             --shp_ind=
                       if shp==0 then -1      --  [-1,0,3,-1,4,8,-1]
                       else ind               --scatter
                     ) aoa_shp shp_scn        --   [0,0,0,0,0,0,0,0,0,0]
  in scatter (replicate aoa_len zero)         --   [-1,0,3,-1,4,8,-1]
             shp_ind aoa_val                  --   [1,1,1,1,1,1,1]
                                              -- res = [1,0,0,1,1,0,0,0,1,0]

let scanExc 't [n] (op: t->t->t) (ne: t) (arr : [n]t) : [n]t =
    scan op ne <| map (\i -> if i>0 then unsafe arr[i-1] else ne) (iota n)

let seg_scatter [n] 't (shp:[]i32) (D_xss:[]t) (I_xss:[n]i32) (V_xss:[n]t)
    : []t =
    let B = scanExc (+) 0 shp

    -- let Bs = map2 (\ n m -> replicate n m) shp B |> flatten
    let inds = scanExc (+) 0 shp |> map2 (\n i->if n>0 then i else -1) shp
    let size = ( last inds ) + ( last shp )
    let vls = scatter (replicate size 0) inds B
    let F = scatter (replicate size 0) inds shp
    let Bs = sgmSumInt F vls

    let I_off = map (\i -> Bs[i] + I_xss[i]) (iota (length I_xss))
    let D_res = scatter (copy D_xss) I_off V_xss
    in D_res

let partition2L 't [n] [m]
                (condsL: [n]bool) (dummy: t)
                (shp: [m]i32, arr: [n]t) :
                ([m]i32, ([m]i32, [n]t)) =
  let begs   = scan (+) 0 shp
  let flags  = mkFlagArray shp 0i32 (map (+1) (iota m))
  let outinds= sgmSumInt flags <| map (\f -> if f==0 then 0 else f-1) flags
  let tflgs = map (\ c -> if c then 1i32 else 0) condsL
  let fflgs = map (\ b -> 1 - b) tflgs
  let indsTL = sgmSumInt flags tflgs
  let tmpL   = sgmSumInt flags fflgs
  let lstL = map2 (\s b -> if s==0 then -1 else unsafe indsTL[b-1] ) shp begs
  let indsFL = map2 (\t sgmind-> t + unsafe lstL[sgmind]) tmpL outinds
  let inds = map3 (\ c iT iF -> if c then iT-1 else iF-1) condsL indsTL indsFL
  let dat = replicate n dummy
  let fltarr = seg_scatter shp dat inds arr
  in  (lstL, (shp,fltarr))


-- let medBoolList (inp: []i32) (nppp: i32) : []bool =
--   let v = inp[nppp/2]
--   in map (\e ->
--             if e <= v then true else false
--          ) inp


let getShp (inp: []bool) = --(len: i32) = --: []i32 =
  let lsts = map (\e -> if e then 1 else 0) inp
  let tss = scan (+) 0i32 lsts
  let ts = tss[length tss-1]
  let fs = (length inp) - ts
  in (ts, fs)
  -- in ts
  -- in map (\_ -> [ts, fs]) (iota len)



let medBoolList (inp: []f32) (nppp: i32) : (i32, f32, []bool) =
  let idx = nppp/2
  let v = inp[idx]
  let res = map (\e ->
            if e <= v then true else false
         ) inp
  in (idx, v, res)



entry main [m] (imB : [m]f32) = --(imA : [m]f32) =
  let h = 4i32 -- 8i32 -- 15i32 -- height without leaves
  let num_nodes  = (1 << (h+1)) - 1 -- 4:31, 32767
  let num_leaves =  1 << (h-1) |> trace -- 4:8, 16384
  let num_ppl = 12i32 -- 92i32 -- number points per leaf

  let (leaves, split_vals, _, _) =
      loop (l, svals, shp, i) = (imB, [], [m], 1i32)
      while i < h do
          let len = 1 << i
          let numlpp = length l / len |> trace
          
          let sres = scan (+) 0 shp
          let inds = zip ([0] ++ (init sres)) sres |> trace

          let (n_l, n_svals, n_shp) = 
              loop (n_l, n_svals, n_shp) = (l, svals, [])
              for j < (length inds) do
                  let fr = 0 --inds[j].0
                  let t  = 10 --inds[j].1
                  let median_idx = numlpp/2
                  let median_val = n_l[median_idx]
                  let split_flag = map (\e -> if e <= median_val then true else false) n_l[fr:t]
                  -- let (split_idxs, split_vs, split_flag) = medBoolList l[fr:t] numlpp
                  let (ts, split_l) = partition2 split_flag[fr:t] 0.0f32 l[fr:t]
                  let tmp = t-fr
                  let new_shp = n_shp ++ [ts,tmp-ts]
                  in (split_l, median_val, new_shp)
              -- in (n_l, n_svals, n_shp)
          --     -- (n_l, n_svals, n_shp)

          let new_svals = svals ++ n_svals
          in (n_l, new_svals, n_shp, i+1)
          -- in (l, svals, shp, i+1)
      in (leaves, split_vals)



-- entry main [m] (imB : [m]f32) = --(imA : [m]f32) =
--   let h = 4i32 -- 8i32 -- 15i32 -- height without leaves
--   let num_nodes  = (1 << (h+1)) - 1 -- 4:31, 32767
--   let num_leaves =  1 << (h-1) |> trace -- 4:8, 16384
--   let num_ppl = 12i32 -- 92i32 -- number points per leaf

--   let (leaves, split_vals, _) =
--       loop (l, svals, shp, i) = (imB, replicate num_nodes f32.nan, [m], 1i32)
--       while i < h do
--           let len = 1 << i
--           let numlpp = length l / len |> trace
          
--           let sres = scan (+) 0 shp
--           let inds = zip ([0] ++ (init sres)) sres

--           let (n_l, n_svals, n_shp) = map (\(fr,to) ->
--                         let (split_idxs, split_vs, split_flag) = medBoolList l[fr:to] numlpp
--                         let (_, split_l) = partition2 split_flag[fr:to] 0.0f32 l[fr:to]
--                         -- let new_shp = new_shp ++ [(to-fr)]
--                         in (split_l, split_vs, n_shp ++ [(to-fr)])
--                     ) inds

--           let new_svals = svals ++ n_svals
--           in (n_l, new_svals, n_shp, i+1)
--   in (leaves, split_vals)


-- [(0,8)]
-- [(0,4), (4,8)]
-- [(0,2),(2,4),(4,6),(6,8)]

-- [8]
-- [4,4]
-- [2,2,2,2]

-- let lr = [l1,r1,l2,r2];
-- let inds = zip (ex_scan (+) 0 lr, scan (+) 0 lr)

  -- Base case 
  -- let (fst_med_idx, fst_med_val, fst_bool_flag)  = medBoolList imB m |> trace
  -- let (_, fst_leaves) = partition2 fst_bool_flag 0.0f32 imB

-- let medBoolList (inp: []f32) (nppp: i32) : (i32, f32, []bool) =
--   let idx = nppp/2
--   let v = inp[idx]
--   let res = map (\e ->
--             if e <= v then true else false
--          ) inp
--   in (idx, v, res)

-- entry main [m] (imB : [m]f32) = --(imA : [m]f32) =
--   let h = 4i32 -- 8i32 -- 15i32 -- height without leaves
--   let num_nodes  = (1 << (h+1)) - 1 -- 4:31, 32767
--   let num_leaves =  1 << (h-1) |> trace -- 4:8, 16384
--   let num_ppl = 12i32 -- 92i32 -- number points per leaf

--   -- Base case 
--   let (fst_med_idx, fst_med_val, fst_bool_flag)  = medBoolList imB m |> trace
--   let (_, fst_leaves) = partition2 fst_bool_flag 0.0f32 imB

--   let (leaves, split_vals, _) =
--       loop (l, svals, i) = (fst_leaves, [fst_med_val], 1i32)
--       while i < h do
--           let len = 1 << i
--           let numlpp = length l / len |> trace
--           let (split_idx, split_v, split_flag) = medBoolList l numlpp
--           let (_, split_l) = partition2 split_flag 0.0f32 l
--           let new_svals = svals ++ [split_v]
--           in (split_l, new_svals, i+1)
--   in (leaves, split_vals)


-- Trace at /futlib/functional.fut:9:42-44: (32768i32, -2710.6992f32, [false, true, true, true, true, false, true, true,


  -- let res = loop (numLeft,l) = ([ab_len],ab)
  --           for i < (3+1)                                                -- h+1
  --           do
  --             let len = 1 << i                                -- 1 << 3 = 0b1000
  --             let numlpp = length l / len                     -- 8 4 2 1
  --             -- let nppp = numlpp * 2 -- points per leaf
  --             let (split_idx, split_flag) = medBoolList l numlpp
  --             let shp = map (\nL ->
  --                               if i == 0
  --                               then [nL]
  --                               else let [split_idx, ab_len - split_idx]
  --                           ) numLeft |> flatten |> trace -- [8,0] [3,5] [2,1,3,2]
  --             let (numLeft', (_,leaves)) = partition2L split_flag 0i32 (shp, l)
  --             in (numLeft',leaves)
  -- in res



-- let fst_nppp = 1 <<  -- first number point per parent
-- entry main =
--   let ab = [4i32, 1i32, 6i32, 2i32, 6i32, 3i32,  5i32,  1i32, 4i32, 1i32, 6i32, 2i32, 6i32, 3i32,  5i32,  7i32]
--   let ab_len = length ab
--   let res = loop (numLeft,l) = ([ab_len],ab)
--             for i < (3+1)                                                -- h+1
--             do
--               let len = 1 << i                                -- 1 << 3 = 0b1000
--               let numlpp = length l / len                     -- 8 4 2 1
--               -- let nppp = numlpp * 2 -- points per leaf
--               let (split_idx, split_flag) = medBoolList l numlpp
--               let shp = map (\nL ->
--                                 if i == 0
--                                 then [nL]
--                                 else let [split_idx, ab_len - split_idx]
--                             ) numLeft |> flatten |> trace -- [8,0] [3,5] [2,1,3,2]
--               let (numLeft', (_,leaves)) = partition2L split_flag 0i32 (shp, l)
--               in (numLeft',leaves)
--   in res


-- split_values: values of split nodes
-- split_dimensions: dimension of split nodes
-- leaves: list of leaves
-- inverse_lookup: per patch, pointer to leaf (int)

-- Depth: 15
-- Leaves number elements in list:       16384
-- inverse_lookup number elements in list:   1517009 (total number patches)
-- split_values number elements in list:     32767   `(2 ** max_depth)`
-- split_dimensions number elements in list:   32767   `(2 ** max_depth)`

-- 1517009/16384 = 92,5

-- entry main =
--   let ab = [4i32, 1i32, 6i32, 2i32, 8i32, 3i32,  5i32,  7i32]
--   let ab_len = length ab
--   let res = loop (numLeft,l,split_flag) = ([ab_len],ab,replicate ab_len false)
--             for i < (3+1)                                                -- h+1
--             do
--               let len = 1 << i                                -- 1 << 3 = 0b1000
--               let numlpp = length l / len                     -- 8 4 2 1
--               -- let nppp = numlpp * 2 -- points per leaf
--               let split_flag = medBoolList l numlpp
--               let shp = map (\nL -> 
--                                 if i == 0
--                                 then [nL]
--                                 else 
--                                   let (ts, fs) = getShp 
--                                   [nL,(nL-numlpp)]
--                             ) numLeft |> flatten |> trace -- [8,0] [3,5] [2,1,3,2]
--               let (numLeft', (_,leaves)) = partition2L split_flag 0i32 (shp, l)
--               in (numLeft',leaves)
--   in res




-- let (s,ab') = partition2 median ab
-- -- s = 4
-- let arr_start = replicate (length ab) 0
-- let arr_start = arr_start[s] = 1
-- --       [   0,    0,    0,    0,    1,     0,     0,     0]
-- --       [[4i32, 1i32, 2i32, 3i32], [6i32,  8i32,  5i32,  7i32]]
-- let ab' = [4i32, 1i32, 2i32, 3i32, 6i32,  8i32,  5i32,  7i32]

-- --       [   1,    0,    1,    0,    1,     0,     1,     0]
-- --       [[4i32, 1i32], [2i32, 3i32], [6i32,  8i32],  [5i32,  7i32]]
-- let ab'' = [2i32, 1i32, 4i32, 3i32, 6i32,  8i32,  5i32,  7i32]


-- Trace at /futlib/functional.fut:9:42-44: ([0i32], ([8i32], [4i32, 1i32, 6i32, 2i32, 8i32, 3i32, 5i32, 7i32]))
-- Trace at /futlib/functional.fut:9:42-44: ([0i32, 2i32], ([4i32, 4i32], [4i32, 1i32, 6i32, 2i32, 8i32, 7i32, 3i32, 5i32]))
-- Trace at /futlib/functional.fut:9:42-44: ([1i32, 2i32, 2i32, 2i32], ([2i32, 2i32, 2i32, 2i32], [4i32, 1i32, 6i32, 2i32,
--                                                        8i32, 7i32, 3i32, 5i32]))
-- Trace at /futlib/functional.fut:9:42-44: ([0i32, 0i32, 1i32, 0i32, 1i32, 1i32, 0i32, 1i32], 
--                                           ([1i32, 1i32, 1i32, 1i32, 1i32, 1i32, 1i32, 1i32], [4i32, 1i32, 6i32, 2i32, 8i32, 7i32, 3i32, 5i32]))



-- let ab = [4i32, 1i32, 6i32, 2i32, 8i32, 3i32,  5i32,  7i32]

-- Trace at /futlib/functional.fut:9:42-44: 8i32
-- Trace at /futlib/functional.fut:9:42-44: 6i32
-- Trace at /futlib/functional.fut:9:42-44: 1i32
-- Trace at /futlib/functional.fut:9:42-44: 4i32
-- Trace at /futlib/functional.fut:9:42-44: [4i32, 1i32, 6i32, 2i32, 8i32, 7i32, 3i32, 5i32]










-----------------------
--- Parallel Filter ---
-----------------------
-- let partition2 [n] 't (conds: [n]bool) (dummy: t) (arr: [n]t) : (i32, [n]t) =
--   let tflgs = map (\ c -> if c then 1 else 0) conds
--   let fflgs = map (\ b -> 1 - b) tflgs

--   let indsT = scan (+) 0 tflgs
--   let tmp   = scan (+) 0 fflgs
--   let lst   = if n > 0 then indsT[n-1] else -1
--   let indsF = map (+lst) tmp

--   let inds  = map3 (\ c indT indF -> if c then indT-1 else indF-1) conds indsT indsF

--   let fltarr= scatter (replicate n dummy) inds arr
--   in  (lst, fltarr)








