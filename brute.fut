-- implement brute-force entry pocket in Futhark 
-- ==
-- compiled input { 
-- [ 42.10298793, -79.7838349, 2.60175886, 15.31100977, -1.51816989,
--   0.33231584, -0.32382814, 0.74201471 ]
-- [ 40.24679201, -79.2333038, 2.60023049, 14.14519061, -1.41773288,
--   0.2697519, -1.42029241, -0.29129826]
-- } 
-- output { 7.3916558642f32 }
--  



-- let sgmSumF32 [n] (flg : [n]i32) (arr : [n]f32) : [n]f32 =
--   let flgs_vals = 
--     scan ( \ (f1, x1) (f2,x2) -> 
--             let f = f1 | f2 in
--             if f2 > 0 then (f, x2)
--             else (f, x1 + x2) )
--          (0,0.0f32) (zip flg arr)
--   let (_, vals) = unzip flgs_vals
--   in vals


let distance [n] (vct1 : [n]f32) 
                 (vct2 : [n]f32) : f32 =
    in map (+) (map2 (\p1 p2 -> (p1-p2)) vct1 vct2)



let main [n] (pat1 : [n]f32) 
             (pat2 : [n]f32) : f32 =
    distance pat1 pat2

-- let main [n] [m] 
--          (mat_inds : [n]i32) (mat_val : [n]f32) 
--          (shp : [m]i32) (vct : []f32) : [m]f32 =
--   spMatVctMult (zip mat_inds mat_val) shp vct



-- (42,10298793-40,24679201)^2 + (-79,7838349-(-79,2333038))^2 + (2,60175886-2,60023049)^2 + (15,31100977-14,14519061)^2 + (-1,51816989-(-1,41773288))^2 +  (0,33231584-0,2697519)^2 + (-0,32382814-(-1,42029241))^2 + (0,74201471-(-0,29129826))^2

