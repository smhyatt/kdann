import "../lib/github.com/diku-dk/sorts/merge_sort"

-- ==
-- entry: nnk
--
-- compiled random input { 3 [35170][8]f32 [35170][8]f32 } auto output

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


-- entry nn1 [m] [n] (imA : [m][n]real) 
--                   (imB : [m][n]real) : []real =
--     map (\a_row ->
--         map (\b_row -> 
--                 euclidean a_row b_row 
--         ) imB |> reduce real_min real_inf  
--     ) imA 


let kmin [m] (k : int) (dists : [m]((int, int), real)) = 
    merge_sort_by_key (.1) (>=) dists --reduce real_min real_inf
    --map (\(idx, elm) -> elm) dists |> merge_sort (f32.<=) 


entry nnk [m] [n] (k : int) (imA : [m][n]real) 
                            (imB : [m][n]real) = --: [m][m]((int, int), real) =

    map (\a_patch ->
        let nn = replicate k real_inf in
        map (\b_patch -> 
            loop dist = euclidean a_patch b_patch for i < k do 
                let dist =
                    if dist <= nn[i] then 
                        let tmp = nn[i] in 
                        nn[i] = dist in
                        dist = tmp
                    else 
                        dist
        ) imB
    ) imA 


entry main [m] [n] (k : int) (imA : [m][n]real) 
                             (imB : [m][n]real) = --: [m][m]((int, int), real) =
    nnk k imA imB


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
