import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from pandas import DataFrame , read_csv


# brute = pd.read_csv('brute.csv')
# brute.columns = ['Brute','Optimised', 'K', 'D']

brute = pd.read_csv('new-brute.csv')
brute.columns = ['Optimised', 'Brute', 'K', 'D']





#################################################################################
#			Dataset testing sorting vs partition 
#################################################################################


# bd4 = brute[brute['D']==8]


# labels = [
# 'K=3', 'K=3', 
# 'K=7', 'K=7'
# ]

# # labels = [
# # 'D=4', 'D=16', 
# # 'D=4', 'D=16', 
# # 'D=4', 'D=16',
# # 'D=4', 'D=16'
# # ]

# x = np.arange(len(labels))  # the label locations
# width = 0.4  # the width of the bars



# fig, ax = plt.subplots()
# rects1 = ax.bar(x - width/2, bd4.Brute, width,   label='Brute Force', color='#1e6dae')
# rects2 = ax.bar(x + width/2, bd4.Optimised, width, label='The Fully Optimised KNN via k-d Trees', color='#6baee6')

# # Add some text for labels, title and custom x-axis tick labels, etc.
# ax.set_ylabel('Performance in milliseconds.')
# ax.set_title('Computing K-Nearest Neighbours with Brute Force versus\n Fully Optimised k-d Trees, for D=8 and K 3 and 7')
# ax.set_xticks(x)
# ax.set_xticklabels(labels)
# ax.legend()


# def autolabel(rects):
#     """Attach a text label above each bar in *rects*, displaying its height."""
#     for rect in rects:
#         height = rect.get_height()
#         ax.annotate('{}'.format(height),
#                     xy=(rect.get_x() + rect.get_width() / 2, height),
#                     xytext=(0, 3),  # 3 points vertical offset
#                     textcoords="offset points",
#                     ha='center', va='bottom')


# autolabel(rects1)
# autolabel(rects2)


# fig.tight_layout()

# plt.show()


#################################################################################


bk2 = brute[brute['K']==2]


# labels = [
# 'K=3', 'K=3', 
# 'K=7', 'K=7'
# ]

labels = [
'D=2', 'D=4', 
'D=6', 'D=8', 
'D=10', 'D=12'
]

# labels = [
# 'D=2', 'D=4', 
# 'D=6', 'D=8', 
# 'D=10', 'D=12',
# 'D=14'
# ]

x = np.arange(len(labels))  # the label locations
width = 0.4  # the width of the bars



fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, bk2.Brute, width,   label='Brute Force', color='#1e6dae')
rects2 = ax.bar(x + width/2, bk2.Optimised, width, label='The Fully Optimised KNN via k-d Trees', color='#6baee6')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Performance in milliseconds.')
ax.set_title('Computing K-Nearest Neighbours with Brute Force versus\n Fully Optimised k-d Trees, for K=2 and Dimensions 2, 4, 6, 8, 10 and 12')
ax.set_xticks(x)
ax.set_xticklabels(labels)
ax.legend()


def autolabel(rects):
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        height = rect.get_height()
        ax.annotate('{}'.format(height),
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')


autolabel(rects1)
autolabel(rects2)


fig.tight_layout()

plt.show()


#################################################################################


#################################################################################


bk6 = brute[brute['K']==6]


# labels = [
# 'K=3', 'K=3', 
# 'K=7', 'K=7'
# ]

labels = [
'D=2', 'D=4', 
'D=6', 'D=8', 
'D=10', 'D=12'
]

x = np.arange(len(labels))  # the label locations
width = 0.4  # the width of the bars



fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, bk6.Brute, width,   label='Brute Force', color='#1e6dae')
rects2 = ax.bar(x + width/2, bk6.Optimised, width, label='The Fully Optimised KNN via k-d Trees', color='#6baee6')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Performance in milliseconds.')
ax.set_title('Computing K-Nearest Neighbours with Brute Force versus\n Fully Optimised k-d Trees, for K=6 and Dimensions 2, 4, 6, 8, 10 and 12')
ax.set_xticks(x)
ax.set_xticklabels(labels)
ax.legend()


def autolabel(rects):
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        height = rect.get_height()
        ax.annotate('{}'.format(height),
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')


autolabel(rects1)
autolabel(rects2)


fig.tight_layout()

plt.show()


#################################################################################


#################################################################################


bk12 = brute[brute['K']==12]


# labels = [
# 'K=3', 'K=3', 
# 'K=7', 'K=7'
# ]

labels = [
'D=2', 'D=4', 
'D=6', 'D=8', 
'D=10', 'D=12'
]

x = np.arange(len(labels))  # the label locations
width = 0.4  # the width of the bars



fig, ax = plt.subplots()
# rects2 = ax.bar(x, bk12.Optimised, width, label='The Fully Optimised KNN via k-d Trees', color='#6baee6')
# rects1 = ax.bar(x, bk12.Brute, width,   label='Brute Force', color='#1e6dae')

rects1 = ax.bar(x - width/2, bk12.Brute, width,   label='Brute Force', color='#1e6dae')
rects2 = ax.bar(x + width/2, bk12.Optimised, width, label='The Fully Optimised KNN via k-d Trees', color='#6baee6')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Performance in milliseconds.')
ax.set_title('Computing K-Nearest Neighbours with Brute Force versus\n Fully Optimised k-d Trees, for K=12 and Dimensions 2, 4, 6, 8, 10 and 12')
ax.set_xticks(x)
ax.set_xticklabels(labels)
ax.legend()


def autolabel(rects):
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        height = rect.get_height()
        ax.annotate('{}'.format(height),
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')


autolabel(rects1)
autolabel(rects2)


fig.tight_layout()

plt.show()


#################################################################################




# X2 = np.arange(len(bk12.Optimised))
X2 = np.arange(2, 14, 2) # 2, 4, 6, 8, 10, 12, 14

plt.title('Computing K-Nearest Neighbours with Brute Force versus\n Fully Optimised k-d Tree, for K=12 and Dimensions 2, 4, 6, 8, 10 and 12')
# plt.xscale('log')
# plt.yscale('log')
plt.ylabel('Performance in milliseconds.')
plt.xlabel('Dimensions.') 

# plt.plot(X2, naivc, linestyle='-', label = "primes-naive w/ C")
plt.plot(X2, bk12.Brute, linestyle='-.', label = "Brute Force", color='#1e6dae')

# plt.plot(X2, flatc, linestyle='-', label = "primes-flat w/ C")
plt.plot(X2, bk12.Optimised, linestyle='-.', label = "The Fully Optimised KNN via k-d Trees", color='#6baee6')

# plt.plot(X2, seqc, linestyle='-', label = "primes-seq w/ C")

plt.legend()
plt.show()








########################################################################################################################
# 				Computing the speed-ups. 
########################################################################################################################

def truncate(n):
    return int(n * 100) / 100

b12 = list(bk12.Brute)
print(b12)
b6 = list(bk6.Brute)
b2 = list(bk2.Brute)

o12 = list(bk12.Optimised)
o6 = list(bk6.Optimised)
o2 = list(bk2.Optimised)

k2 = []
k6 = []
k12 = []

for i in range(len(b2)):
	k12.append(truncate(b12[i]/o12[i]))
	k6.append(truncate(b6[i]/o6[i]))
	k2.append(truncate(b2[i]/o2[i]))

print(k12)
print(k6)
print(k2)

# [78.7, 58.57, 40.04, 17.6, 8.26, 4.77, 3.27]
# [65.49, 53.96, 38.16, 14.41, 6.0, 3.08, 2.12]
# [34.64, 33.42, 27.47, 13.17, 5.72, 2.81, 1.92]

# [78.70945700681143, 58.57797020831243, 40.043016092985255, 17.601118544569903, 8.267196837748115, 4.776611829195324, 3.2799427712650804]
# [65.49718492854049, 53.96970045288397, 38.160084134937435, 14.415451362887525, 6.00528950721355, 3.085056249976617, 2.12212662753462]
# [34.64364737765025, 33.42093748428305, 27.475947724534244, 13.172262744655573, 5.726878760543472, 2.810475983939464, 1.9228790642971583]



sortD9 = [588.9, 654.08, 1816.39, 2904.25, 4209.21, 7229.98]
parD9 = [334.85, 435.98, 2634.65, 4625.58, 20708.11, 32698.24]

sd4 = [65.29, 95.01, 270.54, 355.28, 683.62, 1038.63]
pd4 = [46.89, 82.95, 241.51, 423.54, 892.39, 1597.39]


bests = []

for i in range(len(sortD9)):
    bests.append(truncate(pd4[i]/sd4[i]))

print(bests)

# [0.56, 0.66, 1.45, 1.59, 4.91, 4.52]
# [0.71, 0.87, 0.89, 1.19, 1.3, 1.53]

































