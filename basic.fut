let sgmscan 't [n] (op: t->t->t) (ne: t) (flg : [n]i32) (arr : [n]t) : [n]t =
  let flgs_vals = scan (\ (f1, x1) (f2,x2) ->
                          let f = f1 | f2 in
                          if f2 != 0 then (f, x2)
                                     else (f, op x1 x2)
                       ) (0,ne) (zip flg arr)
  let (_, vals) = unzip flgs_vals
  in vals


let mkFlagArray 't [m]
            (aoa_shp: [m]i32) (zero: t)
            (aoa_val: [m]t  ) : []t = unsafe
  let shp_rot = map (\i->if i==0 then 0
                         else aoa_shp[i-1]
                    ) (iota m)
  let shp_scn = scan (+) 0 shp_rot
  let aoa_len = shp_scn[m-1]+aoa_shp[m-1]
  let shp_ind = map2 (\shp ind ->
                       if shp==0 then -1
                       else ind
                     ) aoa_shp shp_scn
  in scatter (replicate aoa_len zero)
             shp_ind aoa_val
             

let minimum (xs: []f64) = reduce f64.min (f64.inf) xs



             