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
'D=10', 'D=12',
'D=14'
]

x = np.arange(len(labels))  # the label locations
width = 0.4  # the width of the bars



fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, bk2.Brute, width,   label='Brute Force', color='#1e6dae')
rects2 = ax.bar(x + width/2, bk2.Optimised, width, label='The Fully Optimised KNN via k-d Trees', color='#6baee6')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Performance in milliseconds.')
ax.set_title('Computing K-Nearest Neighbours with Brute Force versus\n Fully Optimised k-d Trees, for K=2 and Dimensions 2, 4, 6, 8, 10, 12 and 14')
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
'D=10', 'D=12',
'D=14'
]

x = np.arange(len(labels))  # the label locations
width = 0.4  # the width of the bars



fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, bk6.Brute, width,   label='Brute Force', color='#1e6dae')
rects2 = ax.bar(x + width/2, bk6.Optimised, width, label='The Fully Optimised KNN via k-d Trees', color='#6baee6')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Performance in milliseconds.')
ax.set_title('Computing K-Nearest Neighbours with Brute Force versus\n Fully Optimised k-d Trees, for K=6 and Dimensions 2, 4, 6, 8, 10, 12 and 14')
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
'D=10', 'D=12',
'D=14'
]

x = np.arange(len(labels))  # the label locations
width = 0.4  # the width of the bars



fig, ax = plt.subplots()
rects2 = ax.bar(x, bk12.Optimised, width, label='The Fully Optimised KNN via k-d Trees', color='#6baee6')
rects1 = ax.bar(x, bk12.Brute, width,   label='Brute Force', color='#1e6dae')

# rects1 = ax.bar(x - width/2, bk12.Brute, width,   label='Brute Force', color='#1e6dae')
# rects2 = ax.bar(x + width/2, bk12.Optimised, width, label='The Fully Optimised KNN via k-d Trees', color='#6baee6')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Performance in milliseconds.')
ax.set_title('Computing K-Nearest Neighbours with Brute Force versus\n Fully Optimised k-d Trees, for K=12 and Dimensions 2, 4, 6, 8, 10, 12 and 14')
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
X2 = np.arange(2, 16, 2) # 2, 4, 6, 8, 10, 12, 14

plt.title('Computing K-Nearest Neighbours with Brute Force versus\n Fully Optimised k-d Tree, for K=12 and Dimensions 2, 4, 6, 8, 10, 12 and 14.') 
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

























































