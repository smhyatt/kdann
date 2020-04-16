--
-- ==
-- entry: main
-- compiled input { 
--   [1,2,3,4,5,6,7,8,9,10]
-- }
-- output { [2,3] }

-- segmented scan with (+) on floats:
let sgmSumF32 [n] (flg : [n]i32) (arr : [n]f32) : [n]f32 =
  let flgs_vals = 
    scan ( \ (f1, x1) (f2,x2) -> 
            let f = f1 | f2 in
            if f2 > 0 then (f, x2)
            else (f, x1 + x2) )
         (0,0.0f32) (zip flg arr)
  let (_, vals) = unzip flgs_vals
  in vals

  

let partition2 [n] 't (p : (t -> bool)) (arr : [n]i32) : ([n]i32, i32) =
    let cs = map p arr
    let tfs = map (\f -> if f then 1 else 0) cs
    let isT = scan (+) 0 tfs
    let i = isT[n-1]
    let ffs = map (\f->if f then 0 else 1) cs
    let isF = map (+i) <| scan (+) 0 ffs let inds = map3 (\c iT iF -> 
                                                    if c 
                                                    then iT -1 
                                                    else iF -1 
                                                    ) cs isT isF
    let r = scatter (replicate n 0i32) inds arr 
    in (r, i)


let p (x:i32)= 0 == (x%2)


entry main [n] (arr : [n]i32) =
    
    let b (x:i32) = x <= 5i32
    in partition2 b arr




-- compiled input { 
--   [0,   1,     0,   1,    2,    1,   2,    3,    2,   3,   3  ]
--   [2.0f32, -1.0, -1.0, 2.0, -1.0, -1.0, 2.0, -1.0, -1.0, 2.0, 3.0]
-- }
-- output { [2,3] }
