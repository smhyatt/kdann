
-- ==
-- entry: main
--
-- compiled input @ data/brutetestinput.in
--

--



type real = f32
type int  = i32
let real_min  = f32.min
let real_inf  = f32.inf
let real_sqrt = f32.sqrt

let sqr_distance [n] (vct1 : [n]real) 
                     (vct2 : [n]real) : [n]real = 
    map2 (\p1 p2 -> (p1-p2)*(p1-p2)) vct1 vct2

let euclidean [n] (vct1 : [n]real) 
                  (vct2 : [n]real) : real =
    real_sqrt (reduce (+) 0.0 (sqr_distance vct1 vct2))


let seqEuclidean [n] (vct1: [n]f32) (vct2: [n]f32) : f32 =
    let dist = loop dist = 0.0f32
      for i < n do
          let q = vct1[i]
          let p = vct2[i]
          in ((q-p)*(q-p) + dist)
    in (f32.sqrt dist)



entry main [m] [n] (k: i32) (imA : [m][n]real) 
                  (imB : [m][n]real) : [m][k]real = --([m][k]int, [m][k]real) = -- : [m][k](int,real) =
    --unzip <| map unzip <|
    let res_arr_of_tups =
        map (\a_patch ->
            if a_patch[0] == real_inf
            then replicate k (-2i32, real_inf)
            else
            let  nn = replicate k (-1i32, real_inf)
            in loop nn for q < m do
                let b_patch = imB[q]
                let dist = seqEuclidean a_patch b_patch
                let b_idx = q in
                let (_, _, nn') =
                    loop (dist, b_idx, nn) for i < k do
                        let cur_nn = nn[i].1  in
                        if dist <= cur_nn then 
                            let tmp_ind = nn[i].0--cur_idx
                            let nn[i] = (b_idx, dist) -- let nn' = nn with [i] <- dist in ... nn
                            let b_idx = tmp_ind
                            let dist  = cur_nn
                            in  (dist, b_idx, nn)
                        else    (dist, b_idx, nn)
                in  nn'
        ) imA 

    let (res_inds, res_dsts) = unzip <| map unzip res_arr_of_tups
    in  res_dsts
    -- in  (res_inds, res_dsts)




-- entry main [m] [n] (k: i32) (imA : [m][n]real) 
--                    (imB : [m][n]real) : [m][k](int,real) = --: ([m][k]int, [m][k]real) =
--     nnk k imA imB


-- 1. Benchmark multiple datasets with the below, -e denotes the entrypoint
--    $ futhark bench --backend=opencl -e nn1 -r 2 brute.fut
-- 2. Profile info for a file-saved dataset
--    $ futhark opencl brute.fut
--    $ ./brute -P < dataset.in
-- 3. Profile info for a auto dataset
--    $ futhark dataget brute.fut "[35170][8]f32 [35170][8]f32" | ./brute -P -e nn1 > /dev/null
--    $ futhark dataget brute.fut "[35170][8]f32 [35170][8]f32" | ./brute -D -e nn1 > /dev/null
-- 4. For printing the runtime without futhark bench
--    $ futhark dataget brute.fut "[35170][8]f32 [35170][8]f32" | ./brute -t /dev/stderr -r 10  -e nn1 > /dev/nul      
-- 5. To look at the opencl kernel:
--    $ ./brute --dump-opencl ker.cl
--    and you can locally modify the `ker.cl` file and load it back with --load-opencl, as in:
--    $ futhark dataget brute.fut "[35170][8]f32 [35170][8]f32" | ./brute -D -e nn1 --load-opencl ker.cl > /dev/null






