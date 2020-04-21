#!/bin/bash

FST="100000"
SND="400000"
THD="800000"
FTH="1200000"
FIH="1600000"
SIX="2000000"
STH="4000000"


outputpath=results/
mkdir -p $outputpath

printf 'Datasets with size: %s\n' "$FST"
futhark dataget main.fut "1i32 8i32 [100000][1]f32 [100000][1]f32"    | ./main -t /dev/stderr  >>  $outputpath/"1-100000.txt"
futhark dataget main.fut "3i32 8i32 [100000][4]f32 [100000][4]f32"    | ./main -t /dev/stderr  >>  $outputpath/"3-100000.txt"
futhark dataget main.fut "5i32 8i32 [100000][6]f32 [100000][6]f32"    | ./main -t /dev/stderr  >>  $outputpath/"5-100000.txt"
futhark dataget main.fut "7i32 8i32 [100000][8]f32 [100000][8]f32"    | ./main -t /dev/stderr  >>  $outputpath/"7-100000.txt"
futhark dataget main.fut "17i32 8i32 [100000][16]f32 [100000][16]f32" | ./main -t /dev/stderr  >>  $outputpath/"17-100000.txt"

# printf 'Datasets with size: %s\n' "$SND"
# futhark dataget main.fut "1i32  10i32 [400000][1]f32  [400000][1]f32"  | ./main -t /dev/stderr >>  $outputpath/"1-400000.txt"
# futhark dataget main.fut "3i32  10i32 [400000][4]f32  [400000][4]f32"  | ./main -t /dev/stderr >>  $outputpath/"3-400000.txt"
# futhark dataget main.fut "5i32  10i32 [400000][6]f32  [400000][6]f32"  | ./main -t /dev/stderr >>  $outputpath/"5-400000.txt"
# futhark dataget main.fut "7i32  10i32 [400000][8]f32  [400000][8]f32"  | ./main -t /dev/stderr >>  $outputpath/"7-400000.txt"
# futhark dataget main.fut "17i32 10i32 [400000][16]f32 [400000][16]f32" | ./main -t /dev/stderr >>  $outputpath/"17-400000.txt"

# printf 'Datasets with size: %s\n' "$THD"
# futhark dataget main.fut "1i32  11i32 [800000][1]f32  [800000][1]f32"  | ./main -t /dev/stderr >>  $outputpath/"1-800000.txt"
# futhark dataget main.fut "3i32  11i32 [800000][4]f32  [800000][4]f32"  | ./main -t /dev/stderr >>  $outputpath/"3-800000.txt"
# futhark dataget main.fut "5i32  11i32 [800000][6]f32  [800000][6]f32"  | ./main -t /dev/stderr >>  $outputpath/"5-800000.txt"
# futhark dataget main.fut "7i32  11i32 [800000][8]f32  [800000][8]f32"  | ./main -t /dev/stderr >>  $outputpath/"7-800000.txt"
# futhark dataget main.fut "17i32 11i32 [800000][16]f32 [800000][16]f32" | ./main -t /dev/stderr >>  $outputpath/"17-800000.txt"

# printf 'Datasets with size: %s\n' "$FTH"
# futhark dataget main.fut "1i32  12i32 [1200000][1]f32  [1200000][1]f32"  | ./main -t /dev/stderr >>  $outputpath/"1-1200000.txt"
# futhark dataget main.fut "3i32  12i32 [1200000][4]f32  [1200000][4]f32"  | ./main -t /dev/stderr >>  $outputpath/"3-1200000.txt"
# futhark dataget main.fut "5i32  12i32 [1200000][6]f32  [1200000][6]f32"  | ./main -t /dev/stderr >>  $outputpath/"5-1200000.txt"
# futhark dataget main.fut "7i32  12i32 [1200000][8]f32  [1200000][8]f32"  | ./main -t /dev/stderr >>  $outputpath/"7-1200000.txt"
# futhark dataget main.fut "17i32 12i32 [1200000][16]f32 [1200000][16]f32" | ./main -t /dev/stderr >>  $outputpath/"17-1200000.txt"

# printf 'Datasets with size: %s\n' "$FIH"
# futhark dataget main.fut "1i32  11i32 [1600000][1]f32  [1600000][1]f32"  | ./main -t /dev/stderr >>  $outputpath/"1-1600000.txt"
# futhark dataget main.fut "3i32  11i32 [1600000][4]f32  [1600000][4]f32"  | ./main -t /dev/stderr >>  $outputpath/"3-1600000.txt"
# futhark dataget main.fut "5i32  11i32 [1600000][6]f32  [1600000][6]f32"  | ./main -t /dev/stderr >>  $outputpath/"5-1600000.txt"
# futhark dataget main.fut "7i32  11i32 [1600000][8]f32  [1600000][8]f32"  | ./main -t /dev/stderr >>  $outputpath/"7-1600000.txt"
# futhark dataget main.fut "17i32 11i32 [1600000][16]f32 [1600000][16]f32" | ./main -t /dev/stderr >>  $outputpath/"17-1600000.txt"

# printf 'Datasets with size: %s\n' "$SIX"
# futhark dataget main.fut "1i32  12i32 [2000000][1]f32  [2000000][1]f32"  | ./main -t /dev/stderr >>  $outputpath/"1-2000000.txt"
# futhark dataget main.fut "3i32  12i32 [2000000][4]f32  [2000000][4]f32"  | ./main -t /dev/stderr >>  $outputpath/"3-2000000.txt"
# futhark dataget main.fut "5i32  12i32 [2000000][6]f32  [2000000][6]f32"  | ./main -t /dev/stderr >>  $outputpath/"5-2000000.txt"
# futhark dataget main.fut "7i32  12i32 [2000000][8]f32  [2000000][8]f32"  | ./main -t /dev/stderr >>  $outputpath/"7-2000000.txt"
# futhark dataget main.fut "17i32 12i32 [2000000][16]f32 [2000000][16]f32" | ./main -t /dev/stderr >>  $outputpath/"17-2000000.txt"

# printf 'Datasets with size: %s\n' "$STH"
# futhark dataget main.fut "1i32  13i32 [4000000][1]f32  [4000000][1]f32"  | ./main -t /dev/stderr >>  $outputpath/"1-4000000.txt"
# futhark dataget main.fut "3i32  13i32 [4000000][4]f32  [4000000][4]f32"  | ./main -t /dev/stderr >>  $outputpath/"3-4000000.txt"
# futhark dataget main.fut "5i32  13i32 [4000000][6]f32  [4000000][6]f32"  | ./main -t /dev/stderr >>  $outputpath/"5-4000000.txt"
# futhark dataget main.fut "7i32  13i32 [4000000][8]f32  [4000000][8]f32"  | ./main -t /dev/stderr >>  $outputpath/"7-4000000.txt"
# futhark dataget main.fut "17i32 13i32 [4000000][16]f32 [4000000][16]f32" | ./main -t /dev/stderr >>  $outputpath/"17-4000000.txt"


git pull
git add $outputpath/*
git commit -m "Profiling data and results."
git push

