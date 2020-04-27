#!/bin/bash


# BRUTE FORCE VS. FULLY OPTIMISED 
# printf '\nDatasets with size: 580000 and 524288\n'
# futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [580000][4]f32 --f32-bounds=0:1 -g [524288][4]f32 > data/brute/10test-k3-d4.in
# futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [580000][8]f32 --f32-bounds=0:1 -g [524288][8]f32 > data/brute/10test-k3-d8.in
# futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [580000][4]f32 --f32-bounds=0:1 -g [524288][4]f32 > data/brute/10test-k7-d4.in
# futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [580000][8]f32 --f32-bounds=0:1 -g [524288][8]f32 > data/brute/10test-k7-d8.in


# printf '\nDatasets with size: 524288 and 524288\n'
# futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [524288][4]f32 --f32-bounds=0:1 -g [524288][4]f32 > data/brute/10test-k3-d4-eq.in
# futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [524288][8]f32 --f32-bounds=0:1 -g [524288][8]f32 > data/brute/10test-k3-d8-eq.in
# futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [524288][4]f32 --f32-bounds=0:1 -g [524288][4]f32 > data/brute/10test-k7-d4-eq.in
# futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [524288][8]f32 --f32-bounds=0:1 -g [524288][8]f32 > data/brute/10test-k7-d8-eq.in


# printf '\nDatasets with size: 3000000 and 4194304\n'
# futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [3000000][4]f32 --f32-bounds=0:1 -g [4194304][4]f32 > data/brute/13test-k3-d4.in
# futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [3000000][8]f32 --f32-bounds=0:1 -g [4194304][8]f32 > data/brute/13test-k3-d8.in
# futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [3000000][4]f32 --f32-bounds=0:1 -g [4194304][4]f32 > data/brute/13test-k7-d4.in
# futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [3000000][8]f32 --f32-bounds=0:1 -g [4194304][8]f32 > data/brute/13test-k7-d8.in


# printf '\nDatasets with size: 4194304 and 4194304\n'
# futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][4]f32 --f32-bounds=0:1 -g [4194304][4]f32 > data/brute/13test-k3-d4-eq.in
# futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][8]f32 --f32-bounds=0:1 -g [4194304][8]f32 > data/brute/13test-k3-d8-eq.in
# futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][4]f32 --f32-bounds=0:1 -g [4194304][4]f32 > data/brute/13test-k7-d4-eq.in
# futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][8]f32 --f32-bounds=0:1 -g [4194304][8]f32 > data/brute/13test-k7-d8-eq.in




# TRAVERSAL WITH ALL DIMENSIONS VS. ONE DIMENSION
# printf '\nDatasets with size: 1048576 and 1048576, k:1\n'
# futhark dataset -b --i32-bounds=1:1 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [1048576][1]f32 --f32-bounds=0:1  -g [1048576][1]f32  > data/traverse/11test-k1-d1.in
# futhark dataset -b --i32-bounds=1:1 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [1048576][6]f32 --f32-bounds=0:1  -g [1048576][6]f32  > data/traverse/11test-k1-d6.in
# futhark dataset -b --i32-bounds=1:1 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [1048576][16]f32 --f32-bounds=0:1 -g [1048576][16]f32 > data/traverse/11test-k1-d16.in

# printf '\nDatasets with size: 1048576 and 1048576, k:5\n'
# futhark dataset -b --i32-bounds=5:5 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [1048576][1]f32 --f32-bounds=0:1  -g [1048576][1]f32  > data/traverse/11test-k5-d1.in
# futhark dataset -b --i32-bounds=5:5 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [1048576][6]f32 --f32-bounds=0:1  -g [1048576][6]f32  > data/traverse/11test-k5-d6.in
# futhark dataset -b --i32-bounds=5:5 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [1048576][16]f32 --f32-bounds=0:1 -g [1048576][16]f32 > data/traverse/11test-k5-d16.in

# printf '\nDatasets with size: 1048576 and 1048576, k:17\n'
# futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [1048576][1]f32 --f32-bounds=0:1  -g [1048576][1]f32  > data/traverse/11test-k17-d1.in
# futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [1048576][6]f32 --f32-bounds=0:1  -g [1048576][6]f32  > data/traverse/11test-k17-d6.in
# futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [1048576][16]f32 --f32-bounds=0:1 -g [1048576][16]f32 > data/traverse/11test-k17-d16.in



# printf '\nDatasets with size: 4194304 and 4194304, k:1\n'
# futhark dataset -b --i32-bounds=1:1 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][1]f32 --f32-bounds=0:1 -g [4194304][1]f32   > data/traverse/13test-k1-d1.in
# futhark dataset -b --i32-bounds=1:1 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][6]f32 --f32-bounds=0:1 -g [4194304][6]f32   > data/traverse/13test-k1-d6.in
# futhark dataset -b --i32-bounds=1:1 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][16]f32 --f32-bounds=0:1 -g [4194304][16]f32 > data/traverse/13test-k1-d16.in

# printf '\nDatasets with size: 4194304 and 4194304, k:5\n'
# futhark dataset -b --i32-bounds=5:5 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][1]f32 --f32-bounds=0:1 -g [4194304][1]f32   > data/traverse/13test-k5-d1.in
# futhark dataset -b --i32-bounds=5:5 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][6]f32 --f32-bounds=0:1 -g [4194304][6]f32   > data/traverse/13test-k5-d6.in
# futhark dataset -b --i32-bounds=5:5 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][16]f32 --f32-bounds=0:1 -g [4194304][16]f32 > data/traverse/13test-k5-d16.in

# printf '\nDatasets with size: 4194304 and 4194304, k:17\n'
# futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][1]f32 --f32-bounds=0:1 -g [4194304][1]f32   > data/traverse/13test-k17-d1.in
# futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][6]f32 --f32-bounds=0:1 -g [4194304][6]f32   > data/traverse/13test-k17-d6.in
# futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][16]f32 --f32-bounds=0:1 -g [4194304][16]f32 > data/traverse/13test-k17-d16.in


futhark dataset -b --i32-bounds=1:1 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [1048576][10]f32 --f32-bounds=0:1 -g [1048576][10]f32 > data/traverse/11test-k1-d10.in
futhark dataset -b --i32-bounds=5:5 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [1048576][10]f32 --f32-bounds=0:1 -g [1048576][10]f32 > data/traverse/11test-k5-d10.in
futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [1048576][10]f32 --f32-bounds=0:1 -g [1048576][10]f32 > data/traverse/11test-k17-d10.in


futhark dataset -b --i32-bounds=1:1 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1   -g [4194304][10]f32 --f32-bounds=0:1 -g [4194304][10]f32 > data/traverse/13test-k1-d10.in
futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][10]f32 --f32-bounds=0:1 -g [4194304][10]f32 > data/traverse/13test-k17-d10.in
futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][10]f32 --f32-bounds=0:1 -g [4194304][10]f32 > data/traverse/13test-k17-d10.in




# SORTING VS. PARTITION
# printf '\nDatasets with size: 131072 and 120000\n'
# futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1   -g [131072][4]f32 --f32-bounds=0:1  -g [120000][4]f32  > data/sorting/8test-k3-d4.in
# futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1   -g [131072][16]f32 --f32-bounds=0:1 -g [120000][16]f32 > data/sorting/8test-k3-d16.in
# futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1 -g [131072][4]f32 --f32-bounds=0:1  -g [120000][4]f32  > data/sorting/8test-k11-d4.in
# futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1 -g [131072][16]f32 --f32-bounds=0:1 -g [120000][16]f32 > data/sorting/8test-k11-d16.in


# printf '\nDatasets with size: 131072 and 131072\n'
# futhark dataset -b --i32-bounds=3:3   -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1  -g [131072][4]f32 --f32-bounds=0:1 -g [131072][4]f32  > data/sorting/8test-k3-d4-eq.in
# futhark dataset -b --i32-bounds=3:3   -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1 -g [131072][16]f32 --f32-bounds=0:1 -g [131072][16]f32 > data/sorting/8test-k3-d16-eq.in
# futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1  -g [131072][4]f32 --f32-bounds=0:1 -g [131072][4]f32  > data/sorting/8test-k11-d4-eq.in
# futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1 -g [131072][16]f32 --f32-bounds=0:1 -g [131072][16]f32 > data/sorting/8test-k11-d16-eq.in


# printf '\nDatasets with size: 2097152 and 1900000\n'
# futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1   -g [2097152][4]f32 --f32-bounds=0:1  -g [1900000][4]f32  > data/sorting/12test-k3-d4.in
# futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1   -g [2097152][16]f32 --f32-bounds=0:1 -g [1900000][16]f32 > data/sorting/12test-k3-d16.in
# futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [2097152][4]f32 --f32-bounds=0:1  -g [1900000][4]f32  > data/sorting/12test-k11-d4.in
# futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [2097152][16]f32 --f32-bounds=0:1 -g [1900000][16]f32 > data/sorting/12test-k11-d16.in


# printf '\nDatasets with size: 2097152 and 2097152\n'
# futhark dataset -b --i32-bounds=3:3   -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [2097152][4]f32 --f32-bounds=0:1  -g [2097152][4]f32  > data/sorting/12test-k3-d4-eq.in
# futhark dataset -b --i32-bounds=3:3   -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [2097152][16]f32 --f32-bounds=0:1 -g [2097152][16]f32 > data/sorting/12test-k3-d16-eq.in
# futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [2097152][4]f32 --f32-bounds=0:1  -g [2097152][4]f32  > data/sorting/12test-k11-d4-eq.in
# futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [2097152][16]f32 --f32-bounds=0:1 -g [2097152][16]f32 > data/sorting/12test-k11-d16-eq.in


