#!/bin/bash



printf '\nDatasets with size: 524288 and 580000\n'
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [524288][4]f32 --f32-bounds=0:1 -g [580000][4]f32 > data/11test-k3-d4.in
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [524288][8]f32 --f32-bounds=0:1 -g [580000][8]f32 > data/11test-k3-d8.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [524288][4]f32 --f32-bounds=0:1 -g [580000][4]f32 > data/11test-k7-d4.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [524288][8]f32 --f32-bounds=0:1 -g [580000][8]f32 > data/11test-k7-d8.in


printf '\nDatasets with size: 524288 and 524288\n'
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [524288][4]f32 --f32-bounds=0:1 -g [524288][4]f32 > data/11test-k3-d4-eq.in
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [524288][8]f32 --f32-bounds=0:1 -g [524288][8]f32 > data/11test-k3-d8-eq.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [524288][4]f32 --f32-bounds=0:1 -g [524288][4]f32 > data/11test-k7-d4-eq.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=11:11 -g i32 --f32-bounds=0:1 -g [524288][8]f32 --f32-bounds=0:1 -g [524288][8]f32 > data/11test-k7-d8-eq.in


printf '\nDatasets with size: 4194304 and 3000000\n'
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=14:14 -g i32 --f32-bounds=0:1 -g [4194304][4]f32 --f32-bounds=0:1 -g [3000000][4]f32 > data/14test-k3-d4.in
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=14:14 -g i32 --f32-bounds=0:1 -g [4194304][8]f32 --f32-bounds=0:1 -g [3000000][8]f32 > data/14test-k3-d8.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=14:14 -g i32 --f32-bounds=0:1 -g [4194304][4]f32 --f32-bounds=0:1 -g [3000000][4]f32 > data/14test-k7-d4.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=14:14 -g i32 --f32-bounds=0:1 -g [4194304][8]f32 --f32-bounds=0:1 -g [3000000][8]f32 > data/14test-k7-d8.in


printf '\nDatasets with size: 4194304 and 4194304\n'
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=14:14 -g i32 --f32-bounds=0:1 -g [4194304][4]f32 --f32-bounds=0:1 -g [4194304][4]f32 > data/14test-k3-d4-eq.in
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=14:14 -g i32 --f32-bounds=0:1 -g [4194304][8]f32 --f32-bounds=0:1 -g [4194304][8]f32 > data/14test-k3-d8-eq.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=14:14 -g i32 --f32-bounds=0:1 -g [4194304][4]f32 --f32-bounds=0:1 -g [4194304][4]f32 > data/14test-k7-d4-eq.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=14:14 -g i32 --f32-bounds=0:1 -g [4194304][8]f32 --f32-bounds=0:1 -g [4194304][8]f32 > data/14test-k7-d8-eq.in



