#!/bin/bash

1="100000"
2="400000"
3="800000"
4="1200000"
5="1600000"
6="2000000"
7="4000000"


outputpath=results/
mkdir -p $outputpath

for i in `seq 1 7`
do
	mkdir -p $i
done


printf 'Datasets with size: %s\n' "$FST"
futhark dataget main.fut "1i32 8i32 [100000][1]f32 [100000][1]f32"    | ./main -t /dev/stderr  >>  $outputpath/$1/"1-100000.txt"
futhark dataget main.fut "3i32 8i32 [100000][4]f32 [100000][4]f32"    | ./main -t /dev/stderr  >>  $outputpath/$1/"3-100000.txt"
futhark dataget main.fut "5i32 8i32 [100000][6]f32 [100000][6]f32"    | ./main -t /dev/stderr  >>  $outputpath/$1/"5-100000.txt"
futhark dataget main.fut "7i32 8i32 [100000][8]f32 [100000][8]f32"    | ./main -t /dev/stderr  >>  $outputpath/$1/"7-100000.txt"
futhark dataget main.fut "17i32 8i32 [100000][16]f32 [100000][16]f32" | ./main -t /dev/stderr  >>  $outputpath/$1/"17-100000.txt"

printf 'Datasets with size: %s\n' "$SND"
futhark dataget main.fut "1i32  10i32 [400000][1]f32  [400000][1]f32"  | ./main -t /dev/stderr >>  $outputpath/$2/"1-400000.txt"
futhark dataget main.fut "3i32  10i32 [400000][4]f32  [400000][4]f32"  | ./main -t /dev/stderr >>  $outputpath/$2/"3-400000.txt"
futhark dataget main.fut "5i32  10i32 [400000][6]f32  [400000][6]f32"  | ./main -t /dev/stderr >>  $outputpath/$2/"5-400000.txt"
futhark dataget main.fut "7i32  10i32 [400000][8]f32  [400000][8]f32"  | ./main -t /dev/stderr >>  $outputpath/$2/"7-400000.txt"
futhark dataget main.fut "17i32 10i32 [400000][16]f32 [400000][16]f32" | ./main -t /dev/stderr >>  $outputpath/$2/"17-400000.txt"

printf 'Datasets with size: %s\n' "$THD"
futhark dataget main.fut "1i32  11i32 [800000][1]f32  [800000][1]f32"  | ./main -t /dev/stderr >>  $outputpath/$3/"1-800000.txt"
futhark dataget main.fut "3i32  11i32 [800000][4]f32  [800000][4]f32"  | ./main -t /dev/stderr >>  $outputpath/$3/"3-800000.txt"
futhark dataget main.fut "5i32  11i32 [800000][6]f32  [800000][6]f32"  | ./main -t /dev/stderr >>  $outputpath/$3/"5-800000.txt"
futhark dataget main.fut "7i32  11i32 [800000][8]f32  [800000][8]f32"  | ./main -t /dev/stderr >>  $outputpath/$3/"7-800000.txt"
futhark dataget main.fut "17i32 11i32 [800000][16]f32 [800000][16]f32" | ./main -t /dev/stderr >>  $outputpath/$3/"17-800000.txt"

printf 'Datasets with size: %s\n' "$FTH"
futhark dataget main.fut "1i32  12i32 [1200000][1]f32  [1200000][1]f32"  | ./main -t /dev/stderr >>  $outputpath/$4/"1-1200000.txt"
futhark dataget main.fut "3i32  12i32 [1200000][4]f32  [1200000][4]f32"  | ./main -t /dev/stderr >>  $outputpath/$4/"3-1200000.txt"
futhark dataget main.fut "5i32  12i32 [1200000][6]f32  [1200000][6]f32"  | ./main -t /dev/stderr >>  $outputpath/$4/"5-1200000.txt"
futhark dataget main.fut "7i32  12i32 [1200000][8]f32  [1200000][8]f32"  | ./main -t /dev/stderr >>  $outputpath/$4/"7-1200000.txt"
futhark dataget main.fut "17i32 12i32 [1200000][16]f32 [1200000][16]f32" | ./main -t /dev/stderr >>  $outputpath/$4/"17-1200000.txt"

printf 'Datasets with size: %s\n' "$FIH"
futhark dataget main.fut "1i32  11i32 [1600000][1]f32  [1600000][1]f32"  | ./main -t /dev/stderr >>  $outputpath/$5/"1-1600000.txt"
futhark dataget main.fut "3i32  11i32 [1600000][4]f32  [1600000][4]f32"  | ./main -t /dev/stderr >>  $outputpath/$5/"3-1600000.txt"
futhark dataget main.fut "5i32  11i32 [1600000][6]f32  [1600000][6]f32"  | ./main -t /dev/stderr >>  $outputpath/$5/"5-1600000.txt"
futhark dataget main.fut "7i32  11i32 [1600000][8]f32  [1600000][8]f32"  | ./main -t /dev/stderr >>  $outputpath/$5/"7-1600000.txt"
futhark dataget main.fut "17i32 11i32 [1600000][16]f32 [1600000][16]f32" | ./main -t /dev/stderr >>  $outputpath/$5/"17-1600000.txt"

printf 'Datasets with size: %s\n' "$SIX"
futhark dataget main.fut "1i32  12i32 [2000000][1]f32  [2000000][1]f32"  | ./main -t /dev/stderr >>  $outputpath/$6/"1-2000000.txt"
futhark dataget main.fut "3i32  12i32 [2000000][4]f32  [2000000][4]f32"  | ./main -t /dev/stderr >>  $outputpath/$6/"3-2000000.txt"
futhark dataget main.fut "5i32  12i32 [2000000][6]f32  [2000000][6]f32"  | ./main -t /dev/stderr >>  $outputpath/$6/"5-2000000.txt"
futhark dataget main.fut "7i32  12i32 [2000000][8]f32  [2000000][8]f32"  | ./main -t /dev/stderr >>  $outputpath/$6/"7-2000000.txt"
futhark dataget main.fut "17i32 12i32 [2000000][16]f32 [2000000][16]f32" | ./main -t /dev/stderr >>  $outputpath/$6/"17-2000000.txt"

printf 'Datasets with size: %s\n' "$STH"
futhark dataget main.fut "1i32  13i32 [4000000][1]f32  [4000000][1]f32"  | ./main -t /dev/stderr >>  $outputpath/$7/"1-4000000.txt"
futhark dataget main.fut "3i32  13i32 [4000000][4]f32  [4000000][4]f32"  | ./main -t /dev/stderr >>  $outputpath/$7/"3-4000000.txt"
futhark dataget main.fut "5i32  13i32 [4000000][6]f32  [4000000][6]f32"  | ./main -t /dev/stderr >>  $outputpath/$7/"5-4000000.txt"
futhark dataget main.fut "7i32  13i32 [4000000][8]f32  [4000000][8]f32"  | ./main -t /dev/stderr >>  $outputpath/$7/"7-4000000.txt"
futhark dataget main.fut "17i32 13i32 [4000000][16]f32 [4000000][16]f32" | ./main -t /dev/stderr >>  $outputpath/$7/"17-4000000.txt"


git pull
git add $outputpath/*
git commit -m "Profiling data and results."
git push

