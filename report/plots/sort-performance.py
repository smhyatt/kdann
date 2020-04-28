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


# d16sor = sort[sort['D']==16]
# d16par = sort[sort['D']==16]
# #print(d16sor)

# d16sork11 = d16sor[d16sor['K']==11]
# d16park11 = d16par[d16par['K']==11]

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
# rects1 = ax.bar(x - width/2, d16sor.Sorting, width,   label='Sorting', color='#1e6dae')
# rects2 = ax.bar(x + width/2, d16par.Partition, width, label='Partition', color='#6baee6')

# # Add some text for labels, title and custom x-axis tick labels, etc.
# ax.set_ylabel('Performance in milliseconds.')
# ax.set_title('Sorting Queries w.r.t Leaves Versus using Partition,\n On a Larger Dataset for D=16 and K is 3 and 11')
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


# d16sor = sort[sort['D']==4]
# d16par = sort[sort['D']==4]

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
# rects1 = ax.bar(x - width/2, d16sor.Sorting, width,   label='Sorting', color='#1e6dae')
# rects2 = ax.bar(x + width/2, d16par.Partition, width, label='Partition', color='#6baee6')

# # Add some text for labels, title and custom x-axis tick labels, etc.
# ax.set_ylabel('Performance in milliseconds.')
# ax.set_title('Sorting Queries w.r.t Leaves Versus using Partition,\n On a Larger Dataset for D=4 and K is 3 and 11')
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
#			Dataset testing sorting vs partition - finding break even
#################################################################################


m = [628.86, 560.46, 381.32, 258.0, 148.25, 94.21]
p = [427.82, 322.58, 233.46, 146.26, 102.76, 63.34]

labels = [
'D=10', 'D=9', 'D=8', 'D=7', 'D=6', 'D=5'
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
ax.set_title('Sorting Queries w.r.t Leaves Versus Partition On a Small Dataset \n for K=3 and Testing Dimensions 10, 9, 8, 7, 6 and 5')
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





































