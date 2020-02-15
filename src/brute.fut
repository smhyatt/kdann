-- ==
-- entry: nn1
--
-- compiled random input { [35170][8]f32 [35170][8]f32 } auto output

type real = f32
let real_min  = f32.min
let real_inf  = f32.inf
let real_sqrt = f32.sqrt

let sqr_distance [n] (vct1 : [n]real) 
                     (vct2 : [n]real) : [n]real = 
    map2 (\p1 p2 -> (p1-p2)*(p1-p2)) vct1 vct2

let euclidean [n] (vct1 : [n]real) 
                  (vct2 : [n]real) : real =
    real_sqrt (reduce (+) 0.0 (sqr_distance vct1 vct2))


-- entry nn1 [m] [n] (imA : [m][n]real) 
--                   (imB : [m][n]real) : []real =
--     map (\a_row ->
--         map (\b_row -> 
--                 euclidean a_row b_row 
--         ) imB |> reduce real_min real_inf  
--     ) imA 

-- let kmin [n] (vct : [n]real) : []real = 



entry nnk [m] [n] (imA : [m][n]real) 
                  (imB : [m][n]real) : [][]real =
    map (\a_row ->
        map2 (\b_row bm_i -> 
                euclidean a_row b_row 
        ) imB (iota m) |> reduce real_min real_inf 
    ) imA 


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

-- in map (\(x: i32): [screenY]i32  ->
--            map  (\(y: i32): i32  ->
--                   let c0 = (xmin + (r32(x) * sizex) / r32(screenX),
--                             ymin + (r32(y) * sizey) / r32(screenY))
--                   in divergence(depth, c0))
--                 (iota screenY))
--          (iota screenX)
