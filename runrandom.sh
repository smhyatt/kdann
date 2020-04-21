#!/bin/bash

outputpath=results/
mkdir -p $outputpath

futhark dataget main.fut "1i32  8i32 [100000][1]f32  [100000][1]f32"  | ./main -t /dev/stderr >>  "1-100000.txt"
futhark dataget main.fut "3i32  8i32 [100000][4]f32  [100000][4]f32"  | ./main -t /dev/stderr >>  "3-100000.txt"
futhark dataget main.fut "5i32  8i32 [100000][6]f32  [100000][6]f32"  | ./main -t /dev/stderr >>  "5-100000.txt"
futhark dataget main.fut "7i32  8i32 [100000][8]f32  [100000][8]f32"  | ./main -t /dev/stderr >>  "7-100000.txt"
futhark dataget main.fut "17i32 8i32 [100000][16]f32 [100000][16]f32" | ./main -t /dev/stderr >> "17-100000.txt"

# futhark dataget main.fut "1i32  10i32 [400000][1]f32  [400000][1]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "3i32  10i32 [400000][4]f32  [400000][4]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "5i32  10i32 [400000][6]f32  [400000][6]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "7i32  10i32 [400000][8]f32  [400000][8]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "17i32 10i32 [400000][16]f32 [400000][16]f32" | ./main -t /dev/stderr

# futhark dataget main.fut "1i32  11i32 [800000][1]f32  [800000][1]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "3i32  11i32 [800000][4]f32  [800000][4]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "5i32  11i32 [800000][6]f32  [800000][6]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "7i32  11i32 [800000][8]f32  [800000][8]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "17i32 11i32 [800000][16]f32 [800000][16]f32" | ./main -t /dev/stderr

# futhark dataget main.fut "1i32  12i32 [1200000][1]f32  [1200000][1]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "3i32  12i32 [1200000][4]f32  [1200000][4]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "5i32  12i32 [1200000][6]f32  [1200000][6]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "7i32  12i32 [1200000][8]f32  [1200000][8]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "17i32 12i32 [1200000][16]f32 [1200000][16]f32" | ./main -t /dev/stderr

# futhark dataget main.fut "1i32  11i32 [1600000][1]f32  [1600000][1]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "3i32  11i32 [1600000][4]f32  [1600000][4]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "5i32  11i32 [1600000][6]f32  [1600000][6]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "7i32  11i32 [1600000][8]f32  [1600000][8]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "17i32 11i32 [1600000][16]f32 [1600000][16]f32" | ./main -t /dev/stderr

# futhark dataget main.fut "1i32  12i32 [2000000][1]f32  [2000000][1]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "3i32  12i32 [2000000][4]f32  [2000000][4]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "5i32  12i32 [2000000][6]f32  [2000000][6]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "7i32  12i32 [2000000][8]f32  [2000000][8]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "17i32 12i32 [2000000][16]f32 [2000000][16]f32" | ./main -t /dev/stderr

# futhark dataget main.fut "1i32  13i32 [4000000][1]f32  [4000000][1]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "3i32  13i32 [4000000][4]f32  [4000000][4]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "5i32  13i32 [4000000][6]f32  [4000000][6]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "7i32  13i32 [4000000][8]f32  [4000000][8]f32"  | ./main -t /dev/stderr
# futhark dataget main.fut "17i32 13i32 [4000000][16]f32 [4000000][16]f32" | ./main -t /dev/stderr


git pull
git add $outputpath/*
git commit -m "Profiling data."
git push

