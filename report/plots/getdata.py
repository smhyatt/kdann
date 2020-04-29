import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from pandas import DataFrame , read_csv


par1 = [
    47205.33,
  2790234.67,
    77608.33,
  3357732.00,
    52363.00,
  4801450.67,
    77096.33,
  5866850.67,
   895139.67,
579172471.33,
  1606669.33,
919489909.00,
  1015346.33
]


par2 = [
    48291.67,
  2804616.00,
    77636.33,
  3342884.33,
    53854.00,
  4818202.67,
    79458.33,
  5877597.00,
   926225.33,
661491506.00,
  1626979.33,
882439881.00,
  1041860.33
]

par3 = [
    107201.00,
   3298541.00,
     73244.00,
   4040174.00,
     46541.00,
   5935833.00,
    137637.00,
  11557465.00,
    976847.00,
 626406133.00,
   1622501.00,
 887635414.00,
   1023846.00
]


def truncate(n):
    return int(n * 100) / 100


# pardata = [truncate(i*0.001) for i in ]


pardata = []
for i in range(13):
    save = min(par1[i], par2[i], par3[i])
    pardata.append(truncate(save*0.001))

# print(pardata)



# result
#[47.2, 2790.23, 73.24, 3342.88, 46.54, 4801.45, 77.09, 5866.85, 895.13, 579172.47, 1606.66, 882439.88, 1015.34]

# 47.2, 
# 2790.23, 
# 73.24, 
# 3342.88, 
# 46.54, 
# 4801.45, 
# 77.09, 
# 5866.85, 
# 895.13, 
# 579172.47, 
# 1606.66, 
# 882439.88, 
# 1015.34,
# 870679.56,
# 1814.53,
# 1487264.45


# print(truncate(870679564.33*0.001))
# print(truncate(1814530.33*0.001))
# print(truncate(1487264456.00*0.001))


sor1 = [
556700.33,
1523340.00,
99049.33,
3945433.00,
237314.00,
5533058.33,
95187.00,
1942095.67,
871476.67,
71737351.00,
1056601.33,
93256634.00,
774836.00,
75949725.00,
1148170.33,
117716654.33
]

sor2 = [
    68614.67,
  1287140.00,
    91731.67,
  1550267.00,
    58494.67,
  2238789.00,
    94642.67,
  1754700.00,
   717318.00,
 81353278.00,
  2187016.00,
172073459.00,
  7566183.33,
180681302.33,
  1114384.67,
120381889.33
]



sordata = []
for i in range(16):
    saves = min(sor1[i], sor2[i])
    sordata.append(truncate(saves*0.001))

# print(sordata)


# result

# [68.61, 1287.14, 91.73, 1550.26, 58.49, 2238.78, 94.64, 1754.7, 717.31, 71737.35, 1056.6, 93256.63, 774.83, 75949.72, 1114.38, 117716.65]

# 68.61, 
# 1287.14, 
# 91.73, 
# 1550.26, 
# 58.49, 
# 2238.78, 
# 94.64, 
# 1754.7, 
# 717.31, 
# 71737.35, 
# 1056.6, 
# 93256.63, 
# 774.83, 
# 75949.72, 
# 1114.38, 
# 117716.65





brute = [
3443664.00,
5161552.00,
5953962.00,
7936524.00,
225546032.00,
339422429.00,
388576651.00,
528240234.00
]

brute = [truncate(i*0.001) for i in brute]


opti = [
267292.00,
1028800.00,
289733.00,
1431061.00,
1394971.00,
5002590.00,
1565688.00,
6852613.00
]


opti = [truncate(i*0.001) for i in opti]


# print(brute)
# print(opti)



# result:

# [3443.66, 5161.55, 5953.96, 7936.52, 225546.03, 339422.42, 388576.65, 528240.23]
# [267.29, 1028.8, 289.73, 1431.06, 1394.97, 5002.59, 1565.68, 6852.61]


# 3443.66, 
# 5161.55, 
# 5953.96, 
# 7936.52, 
# 225546.03, 
# 339422.42, 
# 388576.65, 
# 528240.23,

# 267.29, 
# 1028.8, 
# 289.73, 
# 1431.06, 
# 1394.97, 
# 5002.59, 
# 1565.68, 
# 6852.61,




m = [
702894.00,
781393.00,
895220.00,
1018016.00,
1146413.00
]

p = [
564155.00,
718276.00,
917624.00,
1223025.00,
1686598.00,
]




m = [truncate(i*0.001) for i in m]
p = [truncate(i*0.001) for i in p]

# print(m)
# print(p)

# [628.86, 560.46, 381.32, 258.0, 148.25, 94.21]
# [427.82, 322.58, 233.46, 146.26, 102.76, 63.34]


# 628.86, 
# 560.46, 
# 381.32, 
# 258.0, 
# 148.25, 
# 94.21

# 427.82, 
# 322.58, 
# 233.46, 
# 146.26, 
# 102.76, 
# 63.34

# [702.89, 781.39, 895.22, 1018.01, 1146.41]
# [564.15, 718.27, 917.62, 1223.02, 1686.59]




kd = [
313654.00,
397663.00,
647345.00,
1506710.00,
4301244.00,
9499064.00,
17277283.00,
323269.00,
434993.00,
746427.00,
2136644.00,
6216083.00,
13364451.00,
24479515.00,
468335.00,
697512.00,
1248377.00,
3025365.00,
7882991.00,
15542903.00,
29663429.00
]


b = [
10865980.00,
13290172.00,
17786287.00,
19846781.00,
24632685.00,
26696886.00,
33222130.00,
21172624.00,
23476282.00,
28483454.00,
30800635.00,
37329361.00,
41230081.00,
51948623.00,
36862009.00,
40858725.00,
49988509.00,
53249722.00,
65170236.00,
74242407.00,
97294327.00
]



kd = [truncate(i*0.001) for i in kd]
b = [truncate(i*0.001) for i in b]

# print(kd)
# print(b)



# [313.65, 397.66, 647.34, 1506.71, 4301.24, 9499.06, 17277.28, 323.26, 434.99, 746.42, 2136.64, 6216.08, 13364.45, 24479.51, 468.33, 697.51, 1248.37, 3025.36, 7882.99, 15542.9, 29663.42]
# [10865.98, 13290.17, 17786.28, 19846.78, 24632.68, 26696.88, 33222.12, 21172.62, 23476.28, 28483.45, 30800.63, 37329.36, 41230.08, 51948.62, 36862.0, 40858.72, 49988.5, 53249.72, 65170.23, 74242.4, 97294.32]

# 313.65, 
# 397.66, 
# 647.34, 
# 1506.71, 
# 4301.24, 
# 9499.06, 
# 17277.28, 
# 323.26, 
# 434.99, 
# 746.42, 
# 2136.64, 
# 6216.08, 
# 13364.45, 
# 24479.51, 
# 468.33, 
# 697.51, 
# 1248.37, 
# 3025.36, 
# 7882.99, 
# 15542.9, 
# 29663.42

# 10865.98, 
# 13290.17, 
# 17786.28, 
# 19846.78, 
# 24632.68, 
# 26696.88, 
# 33222.12, 
# 21172.62, 
# 23476.28, 
# 28483.45, 
# 30800.63, 
# 37329.36, 
# 41230.08, 
# 51948.62, 
# 36862.0, 
# 40858.72, 
# 49988.5, 
# 53249.72, 
# 65170.23, 
# 74242.4, 
# 97294.32

# Results for main.fut:
# dataset data/brute/2brute2.in:     313654.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/4brute2.in:     397663.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/6brute2.in:     647345.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/8brute2.in:    1506710.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/10brute2.in:   4301244.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/12brute2.in:   9499064.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/14brute2.in:  17277283.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/2brute6.in:     323269.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/4brute6.in:     434993.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/6brute6.in:     746427.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/8brute6.in:    2136644.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/10brute6.in:   6216083.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/12brute6.in:  13364451.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/14brute6.in:  24479515.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/2brute12.in:    468335.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/4brute12.in:    697512.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/6brute12.in:   1248377.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/8brute12.in:   3025365.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/10brute12.in:  7882991.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/12brute12.in: 15542903.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/14brute12.in: 29663429.00μs (avg. of 1 runs; RSD: 0.00)
# futhark bench --backend=opencl -e main -r 1 brute.fut
# Compiling brute.fut...
# Results for brute.fut:
# dataset data/brute/2brute2.in:   10865980.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/4brute2.in:   13290172.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/6brute2.in:   17786287.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/8brute2.in:   19846781.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/10brute2.in:  24632685.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/12brute2.in:  26696886.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/14brute2.in:  33222130.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/2brute6.in:   21172624.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/4brute6.in:   23476282.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/6brute6.in:   28483454.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/8brute6.in:   30800635.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/10brute6.in:  37329361.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/12brute6.in:  41230081.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/14brute6.in:  51948623.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/2brute12.in:  36862009.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/4brute12.in:  40858725.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/6brute12.in:  49988509.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/8brute12.in:  53249722.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/10brute12.in: 65170236.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/12brute12.in: 74242407.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/brute/14brute12.in: 97294327.00μs (avg. of 1 runs; RSD: 0.00)





s = [
588907.00,
654088.00,
4209215.00,
7229986.00
]

p = [
334850.00,
435987.00,
20708117.00,
32698247.00
]




s = [truncate(i*0.001) for i in s]
p = [truncate(i*0.001) for i in p]

print(s)
print(p)

# [588.9, 654.08, 4209.21, 7229.98]
# [334.85, 435.98, 20708.11, 32698.24]



# Results for main.fut:
# dataset data/sorting/8test-k3-d9.in:    588907.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/sorting/8test-k11-d9.in:   654088.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/sorting/12test-k3-d9.in:  4209215.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/sorting/12test-k11-d9.in: 7229986.00μs (avg. of 1 runs; RSD: 0.00)
# futhark bench --backend=opencl -e main -r 1 partition.fut
# Compiling partition.fut...
# Results for partition.fut:
# dataset data/sorting/8test-k3-d9.in:     334850.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/sorting/8test-k11-d9.in:    435987.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/sorting/12test-k3-d9.in:  20708117.00μs (avg. of 1 runs; RSD: 0.00)
# dataset data/sorting/12test-k11-d9.in: 32698247.00μs (avg. of 1 runs; RSD: 0.00)























































