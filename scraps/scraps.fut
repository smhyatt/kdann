-- implement brute-force entry pocket in Futhark 
-- ==
-- compiled input { 
-- [[ 42.10298793, -79.7838349, 2.60175886, 15.31100977, -1.51816989, 0.33231584, -0.32382814, 0.74201471 ],
-- [ 16.12383738, -81.20297697,  9.18194609,  8.01423415,  2.8436501, 6.66378032, -0.27762572, -4.75860471],
-- [ 40.24679201, -79.2333038, 2.60023049, 14.14519061, -1.41773288, 0.2697519, -1.42029241, -0.29129826],
-- [ 15.44447127, -81.24664735, 12.13990008,  8.28621566,  2.18292844, 5.15103481, -3.15649629, -2.2195677 ],
-- [ 32.91962375, -85.13046561,  5.39046141, 17.12822161,  7.40660236, 1.65539818, 1.52035445, 0.26124275],
-- [ 31.61968659, -85.34445102,  5.67319409, 16.86387485,  9.01876531, 0.30119202, 2.32702998, 1.53651485],
-- [ 30.31048368, -85.56897212,  5.96022478, 16.77203727, 10.07698966, -1.05661006, 2.07163732, 2.21731304]] 
-- [[ 28.78936535, -85.83538569,  6.51716341, 16.75055662, 10.67576189, -2.22843162, 1.46958936, 2.10539821],
-- [ 27.0623702 , -86.14835172,  7.30663602, 16.78303453, 10.76833397, -3.20481412, 1.10086571, 1.64354967],
-- [ 25.33944951, -86.47225394,  8.06095571, 16.98905196, 10.12023846, -4.10197455, 0.82099489, 1.72483567],
-- [ 30.31048368, -85.56897212,  5.96022478, 16.77203727, 10.07698966, -1.05661006, 2.07163732, 2.21731304],
-- [ 15.67464174, -81.23323947, 11.11161762,  8.20690533,  2.31358571, 5.68943279, -2.19558088, -2.87590312],
-- [ 15.90064531, -81.21789632, 10.12623221,  8.11775879,  2.54054243, 6.19176585, -1.20884612, -3.76854811],
-- [ 16.11114534, -81.18707213,  9.66154816,  8.04745341,  2.88450697, 6.10426734, 0.41254254, -4.61810116]]
-- } 
-- output { [ 42.10298793, -79.7838349, 2.60175886, 15.31100977, -1.51816989, 0.33231584, -0.32382814, 0.74201471 ] }
--  

let sqr_distance  [n] (vct1 : [n]f64) 
                  (vct2 : [n]f64) : [n]f64 =
    map2 (\p1 p2 -> (p1-p2)**2) vct1 vct2

let euclidean [n] (vct1 : [n]f64) 
                  (vct2 : [n]f64) : f64 =
    f64.sqrt (reduce (+) 0f64 (sqr_distance vct1 vct2))


entry main [m] [n] (imA : [m][n]f64) 
                   (imB : [m][n]f64) : []f64 =
    map (\a_row ->
        map (\b_row -> 
            euclidean a_row b_row 
        ) imB |> reduce f64.min (f64.inf)   
    ) imA 


let kmin [m] (k : int) (dists : [m]((int, int), real)) = 
    merge_sort_by_key (.1) (>=) dists --reduce real_min real_inf
    |> 0:k
    --map (\(idx, elm) -> elm) dists |> merge_sort (f32.<=) 


entry nnk [m] [n] (k : int) (imA : [m][n]real) 
                            (imB : [m][n]real) = --: [m][m]((int, int), real) =
    map2 (\a_row (a_idx:int) ->
        map2 (\b_row (b_idx:int) -> 
                ((a_idx, b_idx), euclidean a_row b_row)
        ) imB (iota m) |> kmin k -- reduce real_min real_inf 
    ) imA (iota m)


entry nnk [m] [n] (imA : [m][n]real) 
                  (imB : [m][n]real) = --: [m][m]((int, int), real) =

    map (\a_patch ->
        let nn = replicate k (-1, real_inf)
        in
        loop nn for q < m do
            let b_patch = imB[q]
            let dist = euclidean a_patch b_patch
            let b_idx = q in
            let (_, nn') =
                loop (dist, b_idx, nn) for i < k do
                    let (cur_idx, cur_nn) = nn[i] in
                    if dist <= cur_nn then 
                        let nn[i] = (b_idx, dist) -- let nn' = nn with [i] <- dist in ... nn
                        let b_idx = cur_idx
                        let dist = cur_nn
                        in  (dist, b_idx, nn)
                    else    (dist, b_idx, nn)
            in  nn'
    ) imA 


CONSUMING BUG ONE 

entry nnk [m] [n] (imA : [m][n]real) 
                  (imB : [m][n]real) = --: [m][m]((int, int), real) =

    map (\a_patch ->
        let nn = replicate k (-1, real_inf)
        in
        loop nn for q < m do
            let b_patch = imB[q]
            let dist = euclidean a_patch b_patch
            let b_idx = q in
            let (_, _, nn') =
                loop (dist, b_idx, nn) for i < k do
                    let (cur_idx, cur_nn) = nn[i] in -- (i,32.33) in
                    if dist <= cur_nn then
                        let nn[i] = (b_idx, dist)  --let nn' = nn with [i] <- (b_idx, dist) --in ... nn
                        let b_idx = cur_idx
                        let dist = cur_nn
                        in  (dist, b_idx, nn)
                    else    (dist, b_idx, nn)
            in  nn'
    ) imA 



let kmin [m] (k : int) (dists : [m](int, real)) : [k](int, real) = 
    let fullarr = merge_sort_by_key (.1) (>=) dists 
    in  fullarr[0:k]


entry nnk_sort [m] [n] (imA : [m][n]real) 
                       (imB : [m][n]real) : ([m][k]int, [m][k]real) =
    unzip <| map unzip <|
    map (\a_row ->
        map2 (\b_row b_idx -> 
                (b_idx, euclidean a_row b_row)
        ) imB (iota m) |> kmin k 
    ) imA 




