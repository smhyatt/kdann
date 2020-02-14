

let sqr_distance  [n] (vct1 : [n]f64) 
                  (vct2 : [n]f64) : [n]f64 =
    map2 (\p1 p2 -> (p1-p2)*(p1-p2)) vct1 vct2

let euclidean [n] (vct1 : [n]f64) 
                  (vct2 : [n]f64) : f64 =
    f64.sqrt (reduce (+) 0f64 (sqr_distance vct1 vct2))


entry main [m] [n] (imA : [m][n]f64) 
                   (imB : [m][n]f64) : []f64 =
    map (\a_row ->
        reduce f64.min (f64.inf) 
            (map (\b_row -> 
                    euclidean a_row b_row 
            ) imB 
        ) 
    ) imA 

