import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from pandas import DataFrame , read_csv


sort = pd.read_csv('sort.csv')
sort.columns = ['Partition','Sorting', 'K', 'D', 'EQ']

# gapminder_2002 = gapminder[gapminder['year']==2002]

k11par = sort[sort['K']==11]
print(k11par)
print(k11par.Partition)

EQk11par = k11par[k11par['EQ']==1]
NEk11par = k11par[k11par['EQ']==0]
print(EQk11par.Partition)
print(NEk11par.Partition)

k11sor = sort[sort['K']==11]
print(k11sor)
print(k11sor.Sorting)

EQk11sor = k11sor[k11sor['EQ']==1]
NEk11sor = k11sor[k11sor['EQ']==0]
print(EQk11sor.Sorting)
print(NEk11sor.Sorting)


k3par = sort[sort['K']==3]
print(k3par)
print(k3par.Partition)

# EQk11par = k11par[k11par['EQ']==1]
# NEk11par = k11par[k11par['EQ']==0]
# print(EQk11par.Partition)
# print(NEk11par.Partition)

k3sor = sort[sort['K']==3]
print(k3sor)
print(k3sor.Sorting)



#################################################################################
#			Dataset testing sorting vs partition 
#################################################################################

# OBS - ORIGIANLLY 16 BUT HAD TO BE 9

d16sor = sort[sort['D']==9]
d16par = sort[sort['D']==9]
#print(d16sor)

# d16sork11 = d16sor[d16sor['K']==11]
# d16park11 = d16par[d16par['K']==11]

sortD9 = [588.9, 654.08, 4209.21, 7229.98]
parD9 = [334.85, 435.98, 20708.11, 32698.24]

sortD9big = [4209.21, 7229.98]
parD9big = [20708.11, 32698.24]

sortD9small = [588.9, 654.08] # , 4209.21, 7229.98]
parD9small = [334.85, 435.98] # , 20708.11, 32698.24]

# labels = [
# 'K=3\n131072,\n120000', 'K=11\n131072\n120000', 
# 'K=3\n2097152,\n1900000', 'K=11\n2097152,\n1900000'
# ]

labels = [
# 'K=3\n131072 and 120000', 'K=11\n131072 and 120000' ]#, 
'K=3\n2097152, and 1900000', 'K=11\n2097152, and 1900000'
]

# labels = [
# 'D=4', 'D=16', 
# 'D=4', 'D=16', 
# 'D=4', 'D=16',
# 'D=4', 'D=16'
# ]

x = np.arange(len(labels))  # the label locations
width = 0.4  # the width of the bars



fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, sortD9big, width,   label='Sorting',   color='#1e6dae')
rects2 = ax.bar(x + width/2, parD9big, width, label='Partition', color='#6baee6')

# rects1 = ax.bar(x - width/2, d16sor.Sorting, width,   label='Sorting',   color='#1e6dae')
# rects2 = ax.bar(x + width/2, d16par.Partition, width, label='Partition', color='#6baee6')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Performance in milliseconds.')
ax.set_title('Sorting Queries w.r.t Leaves Versus using Partition,\n On a Datasets 2097152 and 1900000, for D=9 and K is 3 and 11')
# ax.set_title('Sorting Queries w.r.t Leaves Versus using Partition,\n On a Datasets 131072 and 120000, for D=9 and K is 3 and 11')
# ax.set_title('Sorting Queries w.r.t Leaves Versus using Partition, On a Datasets 131072\n and 120000 and Datasets 2097152 and 1900000, for D=9 and K is 3 and 11')
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
#			Dataset testing sorting vs partition 
#################################################################################


d16sor = sort[sort['D']==4]
# d16par = sort[sort['D']==4]

# sorD4 = d16sor[d16sor['EQ']==0]
# print(sorD4)
# # parD4 = d16sor[d16sor['EQ']==0]

# 895.13,      717.31,      3	 ,   4 ,  0
# 1606.66,     1056.6,      11,   4  ,  0



labels = [
'K=3', 'K=11', 
'K=3', 'K=11'
]

# labels = [
# 'D=4', 'D=16', 
# 'D=4', 'D=16', 
# 'D=4', 'D=16',
# 'D=4', 'D=16'
# ]

x = np.arange(len(labels))  # the label locations
width = 0.4  # the width of the bars



fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, sorD4.Sorting, width,   label='Sorting', color='#1e6dae')
rects2 = ax.bar(x + width/2, sorD4.Partition, width, label='Partition', color='#6baee6')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Performance in milliseconds.')
ax.set_title('Sorting Queries w.r.t Leaves Versus using Partition, On a Datasets 131072\n and 120000 and Datasets 2097152 and 1900000, for D=9 and K is 3 and 11')
# ax.set_title('Sorting Queries w.r.t Leaves Versus using Partition,\n On a Larger Dataset for D=4 and K is 3 and 11')
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
#			Dataset testing sorting vs partition - finding break even
#################################################################################


# m = [628.86, 560.46, 381.32, 258.0, 148.25, 94.21]
# p = [427.82, 322.58, 233.46, 146.26, 102.76, 63.34]

m = [702.89, 781.39, 895.22, 1018.01, 1146.41]
p = [564.15, 718.27, 917.62, 1223.02, 1686.59]

labels = [
'D=11', 'D=12', 'D=13', 'D=14', 'D=15'
]

# labels = [
# 'D=4', 'D=16', 
# 'D=4', 'D=16', 
# 'D=4', 'D=16',
# 'D=4', 'D=16'
# ]

x = np.arange(len(labels))  # the label locations
width = 0.4  # the width of the bars



fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, m, width,   label='Sorting', color='#1e6dae')
rects2 = ax.bar(x + width/2, p, width, label='Partition', color='#6baee6')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Performance in milliseconds.')
ax.set_title('Sorting Queries w.r.t Leaves Versus Partition On a Small Dataset \n for K=3 and Testing Dimensions 11, 12, 13, 14 and 15')
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
#			Dataset testing sorting vs partition - small dataset
#################################################################################

# sortsmall = pd.read_csv('small-sort.csv')
# sortsmall.columns = ['Partition','Sorting', 'K', 'D', 'EQ']

# d16sorsmall = sortsmall[sortsmall['D']==16]
# d16parsmall = sortsmall[sortsmall['D']==16]


# labels = [
# 'K=3', 'K=11', 
# 'K=3', 'K=11'
# ]


# x = np.arange(len(labels))  # the label locations
# width = 0.4  # the width of the bars

# fig, ax = plt.subplots()
# rects1 = ax.bar(x - width/2, d16sorsmall.Sorting, width,   label='Sorting', color='#1e6dae')
# rects2 = ax.bar(x + width/2, d16parsmall.Partition, width, label='Partition', color='#6baee6')

# # Add some text for labels, title and custom x-axis tick labels, etc.
# ax.set_ylabel('Performance in milliseconds.')
# ax.set_title('Sorting Queries w.r.t Leaves Versus using Partition,\n On a Small Dataset for D=16 and K is 3 and 11')
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




#################################################################################
#			Dataset testing sorting vs partition - small dataset
#################################################################################


# d4sorsmall = sortsmall[sortsmall['D']==4]
# d4parsmall = sortsmall[sortsmall['D']==4]

# labels = [
# 'K=3', 'K=11', 
# 'K=3', 'K=11'
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
# rects1 = ax.bar(x - width/2, d4sorsmall.Sorting, width,   label='Sorting', color='#1e6dae')
# rects2 = ax.bar(x + width/2, d4parsmall.Partition, width, label='Partition', color='#6baee6')

# # Add some text for labels, title and custom x-axis tick labels, etc.
# ax.set_ylabel('Performance in milliseconds.')
# ax.set_title('Sorting Queries w.r.t Leaves Versus using Partition,\n On a Small Dataset for D=4 and K is 3 and 11')
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












#################################################################################
#			Dataset testing sorting vs partition 
#################################################################################




# labels = ['D=4\nDatasets: 131072,\n120000', 'D=16\nDatasets: 131072,\n120000', 
# 'D=4\nDatasets: 131072,\n131072', 'D=16\nDatasets: 131072,\n131072', 
# 'D=4\nDatasets: 2097152,\n1900000', 'D=16\nDatasets: 2097152,\n1900000',
# 'D=4\nDatasets: 2097152,\n2097152', 'D=16\nDatasets: 2097152,\n2097152'
# ]

# labels = [
# 'D=4', 'D=16', 
# 'D=4', 'D=16', 
# 'D=4', 'D=16',
# 'D=4', 'D=16'
# ]

# x = np.arange(len(labels))  # the label locations
# width = 0.4  # the width of the bars



# fig, ax = plt.subplots()
# rects1 = ax.bar(x - width/2, k3sor.Sorting, width,   label='Partition versus Sorting', color='#1e6dae')
# rects2 = ax.bar(x + width/2, k3par.Partition, width, label='Partition versus Sorting', color='#6baee6')

# # Add some text for labels, title and custom x-axis tick labels, etc.
# ax.set_ylabel('Performance in milliseconds.')
# ax.set_title('Sorting Queries w.r.t Leaves Versus using Partition, for K=3 and Dimensions 4 and 16')
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





































