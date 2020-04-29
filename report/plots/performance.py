
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from pandas import DataFrame , read_csv
# from matplotlib import pyplot


# # Generate normally distributed data
# data = np.random.randn(1000)


# # Plot a histogram with both a rugplot and kde graph superimposed
# sns.distplot(data, kde=True, rug=True)


# planets = sns.load_dataset('planets')
# planets.head()


# with sns.axes_style('white'):
#     g = sns.factorplot("year", data=planets, aspect=4.0, kind='count',
#                        hue='method', order=range(2001, 2015))
#     g.set_ylabels('Number of Planets Discovered')



# 11test-k1-d1.in:      278409.00		286836.00
# 11test-k1-d6.in:      576889.00		704447.00
# 11test-k1-d10.in:    3882609.00		8563637.00
# 11test-k5-d1.in:      282767.00		289254.00
# 11test-k5-d6.in:      727948.00		948102.00
# 11test-k5-d10.in:    5946092.00		13082975.00
# 11test-k17-d1.in:     675644.00		627067.00
# 11test-k17-d6.in:    1762943.00		2367440.00
# 11test-k17-d10.in:   9783637.00		22904642.00
# 13test-k1-d1.in:     1012280.00		1069709.00
# 13test-k1-d6.in:     1991181.00		2373850.00
# 13test-k1-d10.in:   10677555.00		30748426.00
# 13test-k5-d1.in:     1041518.00		1086467.00
# 13test-k5-d6.in:     2698815.00		3569390.00
# 13test-k5-d10.in:   19044828.00		58172280.00
# 13test-k17-d1.in:    2342703.00		2388423.00
# 13test-k17-d6.in:    7151400.00		9204127.00
# 13test-k17-d10.in.: 36649144.00		111723194.00









# sns.set_context('paper')

# load dataset
# titanic = sns.load_dataset('titanic')
# print(titanic.head())

# traverse = sns.load_dataset('traverse.csv')

# df = pd.read_csv('iris.csv')
# df.columns = ['sepal-len','sepal-wd','petal-len','petal-wd','species']
# sns.pairplot(data=df, hue='species', palette="Set2")


alld = [
278409.00,
576889.00,
3882609.00,
282767.00,
727948.00,
5946092.00,
675644.00,
1762943.00,
9783637.00,
1012280.00,
1991181.00,
10677555.00,
1041518.00,
2698815.00,
19044828.00,
2342703.00,
7151400.00,
36649144.00
]

oned = [
286836.00,
704447.00,
8563637.00,
289254.00,
948102.00,
13082975.00,
627067.00,
2367440.00,
22904642.00,
1069709.00,
2373850.00,
30748426.00,
1086467.00,
3569390.00,
58172280.00,
2388423.00,
9204127.00,
111723194.00
]


k1 = [278409.00,
576889.00,
3882609.00]


data = [[
278409.00,
576889.00,
3882609.00,
282767.00,
727948.00,
5946092.00,
675644.00,
1762943.00,
9783637.00,
1012280.00,
1991181.00,
10677555.00,
1041518.00,
2698815.00,
19044828.00,
2342703.00,
7151400.00,
36649144.00
], [
286836.00,
704447.00,
8563637.00,
289254.00,
948102.00,
13082975.00,
627067.00,
2367440.00,
22904642.00,
1069709.00,
2373850.00,
30748426.00,
1086467.00,
3569390.00,
58172280.00,
2388423.00,
9204127.00,
111723194.00
]]



# plt.bar([1], [940, 1000], 1, label="",       color='#12446d')
# plt.bar([2.5], [940, 1200], 1, label="CUDA", color='#1e6dae')
# plt.bar([4], [3178, 3000], 1, label="C",     color='#6baee6')
# plt.yscale('log')
# plt.legend()
# plt.xticks([])
# # plt.xlabel('Comparison between Futhark, CUDA and the Sequential Performances.')
# plt.ylabel('Logarithmic scale of the runtime microseconds.')
# plt.title('Performances of Block and Register \n Tiled Batch Matrix-Matrix Multiplication')
# plt.show()




df1 = pd.read_csv('trav-d-1.csv')
df1.columns = ['All','One', 'K', 'D']
df6 = pd.read_csv('trav-d-6.csv')
df6.columns = ['All','One', 'K', 'D']
df16 = pd.read_csv('trav-d-16.csv')
df16.columns = ['All','One', 'K', 'D']

k5 = pd.read_csv('trav-k-5.csv')
k5.columns = ['All','One', 'K', 'D']


# labels = ['G1', 'G2', 'G3', 'G4', 'G5', 'G6']
# # labels = ['G1', 'G2', 'G3', 'G4', 'G5']
# # men_means = [20, 34, 30, 35, 27]
# # women_means = [25, 32, 34, 20, 25]

# x = np.arange(len(labels))  # the label locations
# width = 0.35  # the width of the bars

# fig, ax = plt.subplots()
# rects1 = ax.bar(x - width/2, k5.All, width, label='All')
# rects2 = ax.bar(x + width/2, k5.One, width, label='One')
# # rects1 = ax.bar(x - width/2, df16.All, width, label='All')
# # rects2 = ax.bar(x + width/2, df16.One, width, label='One')
# # rects3 = ax.bar(x - width/2, df6.One, width, label='One')
# # rects4 = ax.bar(x + width/2, df6.One, width, label='One')
# # rects2 = ax.bar(x + width/2, df16, width, label='Women')

# # Add some text for labels, title and custom x-axis tick labels, etc.
# ax.set_ylabel('Performance in microseconds.')
# ax.set_title('Traversal Checking All Dimensions Versus Checking One Dimension')
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
# # autolabel(rects3)
# # autolabel(rects4)

# fig.tight_layout()

# # plt.show()




def truncate(n):
	return int(n * 100) / 100




#################################################################################
#			Dataset testing traversal for k=5 and dims 1, 6 and 16
#################################################################################


# 4194304

k5 = pd.read_csv('trav-k5-2.csv')
k5.columns = ['All','One', 'K', 'D']

labels = ['D=6\nDataset: 1048576', 'D=16\nDataset: 1048576', 'D=6\nDataset: 4194304', 'D=16\nDataset: 4194304']
# labels = ['D=1\nDataset: 1048576', 'D=6\nDataset: 1048576', 'D=16\nDataset: 1048576', 'D=1\nDataset: 4194304', 'D=6\nDataset: 4194304', 'D=16\nDataset: 4194304']

x = np.arange(len(labels))  # the label locations
width = 0.4  # the width of the bars

allk5 = [truncate(i*0.001) for i in k5.All]
onek5 = [truncate(i*0.001) for i in k5.One]

fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, allk5, width, label='Traversal Checking Median of All Dimensions.', color='#1e6dae')
rects2 = ax.bar(x + width/2, onek5, width, label='Traversal Checking Median of One Dimension.', color='#6baee6')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Performance in milliseconds.')
ax.set_title('Traversal Checking All Dimensions versus Checking\nOne Dimension, for K=5 and Dimensions 6 and 16')
# ax.set_yticks(k5.All)
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
#			Dataset testing traversal for k=5 and dims 1, 6 and 16
#################################################################################



# k17 = pd.read_csv('trav-k-17.csv')
# k17.columns = ['All','One', 'K', 'D']

# k1 = pd.read_csv('trav-k-1.csv')
# k1.columns = ['All','One', 'K', 'D']

# labels = ['D=1\nDataset: 1048576', 'D=6\nDataset: 1048576', 'D=16\nDataset: 1048576', 'D=1\nDataset: 4194304', 'D=6\nDataset: 4194304', 'D=16\nDataset: 4194304']

# x = np.arange(len(labels))  # the label locations
# width = 0.4  # the width of the bars


# allk5 = [truncate(i*0.001) for i in k5.All]
# onek5 = [truncate(i*0.001) for i in k5.One]
# allk17 = [truncate(i*0.001) for i in k17.All]
# onek17 = [truncate(i*0.001) for i in k17.One]

# fig, ax = plt.subplots()
# rects1 = ax.bar(x - width/2, allk17, width, label='Traversal Checking Median of All Dimensions.', color='#1e6dae')
# rects2 = ax.bar(x + width/2, onek17, width, label='Traversal Checking Median of One Dimension.',  color='#12446d')
# rects3 = ax.bar(x - width/2, allk5, width, label='All', color='#6baee6')
# rects4 = ax.bar(x + width/2, onek5, width, label='One', color='#6baee6')


# # Add some text for labels, title and custom x-axis tick labels, etc.
# ax.set_ylabel('Performance in milliseconds.')
# ax.set_title('Traversal Checking All Dimensions Versus Checking\nOne Dimension, for K=17, K=5 and Dimensions 1, 6 and 16')
# # ax.set_yticks(k5.All)
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
# autolabel(rects3)
# autolabel(rects4)


# fig.tight_layout()

# plt.show()


#################################################################################



#################################################################################
#			Dataset testing traversal for k=5 and dims 1, 6 and 16
#################################################################################



d16 = pd.read_csv('trav-d-16.csv')
d16.columns = ['All','One', 'K', 'D']

labels = ['K=1\nDataset: 1048576', 'K=5\nDataset: 1048576', 'K=17\nDataset: 1048576', 'K=1\nDataset: 4194304', 'K=5\nDataset: 4194304', 'K=17\nDataset: 4194304']

x = np.arange(len(labels))  # the label locations
width = 0.4  # the width of the bars

alld16 = [truncate(i*0.001) for i in d16.All]
oned16 = [truncate(i*0.001) for i in d16.One]

fig, ax = plt.subplots()
rects1 = ax.bar(x - width/2, alld16, width, label='Traversal Checking Median of All Dimensions.', color='#1e6dae')
rects2 = ax.bar(x + width/2, oned16, width, label='Traversal Checking Median of One Dimension.', color='#6baee6')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Performance in milliseconds.')
ax.set_title('Traversal Checking All Dimensions Versus Checking\nOne Dimension, for D=12 and K 1, 5 and 17')
# ax.set_yticks(k5.All)
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





# # data = [[30, 25, 50, 20],
# # [40, 23, 51, 17],
# # [35, 22, 45, 19]]
# X = np.arange(18)
# plt.figure(figsize=(10,5))
# # X = ['C', 'C++', 'Java', 'Python', 'PHP']
# fig = plt.figure()
# ax = fig.add_axes([0,0,1,1])
# ax.bar(X + 0.00, data[0], color='#12446d', width = 0.25)
# ax.bar(X + 0.25, data[1], color = '#1e6dae', width = 0.25)
# ax.plot(X, data[0])


# ax.set_ylabel('Performance in microseconds.')
# ax.set_title('Traversal Checking All Dimensions Versus Checking One Dimension')
# # ax.set_xticks(x)
# # ax.set_xticklabels(labels)
# ax.legend()

# # plt.title('Traversal Checking All Dimensions Versus Checking One Dimension') 
# # plt.xlabel('Various Ks and Dimensions.')
# # plt.ylabel('Performance in microseconds.') 

# # fig.tight_layout()
# plt.show()

# ax.bar(X + 0.50, data[2], color='#6baee6', width = 0.25)








for i in range(18):
	print(oned[i]-alld[i])












# sns.distplot(alld, kde=False);
# plt.axvline(0, color="k", linestyle="--");


# sns.distplot(alld)
# sns.distplot(oned);



# plt.style.use('ggplot')
# plt.hist(x, bins=18)
# plt.show()



# X2 = np.arange(0, 18, 1)

# diff = pd.read_csv('diffs.csv')
# diff.columns = ['Diff','K', 'D']

# plt.figure(figsize=(10,5))
# plt.title('Traversal Checking All Dimensions Versus Checking One Dimension') 
# # plt.xscale('log')
# # plt.yscale('log')
# plt.xlabel('Various Ks and Dimensions')
# plt.ylabel('Performance in microseconds.') 

# # plt.xticks()
# # plt.yticks()
# plt.yscale('log')

# # plt.plot(X2, naivc, linestyle='-', label = "primes-naive w/ C")
# # plt.plot(X2, diff.Diff, linestyle='-.', label = "primes-naive w/ OpenCL")

# # plt.plot(X2, flatc, linestyle='-', label = "primes-flat w/ C")
# # plt.plot(X2, alld, linestyle='-.', label = "primes-flat w/ OpenCL")

# # plt.plot(X2, seqc, linestyle='-', label = "primes-seq w/ C")

# plt.legend()
# plt.show()




# df = pd.read_csv('trav.csv')
# df.columns = ['All','One', 'K', 'D']
# # print(df.head())
# print(df)

# plt.figure(figsize=(10,5))
# plt.hist(df.All)
# plt.hist(df.One)

# # plt.plot(df.K, df.All)
# # plt.plot(df.K, df.One)

# plt.xticks(df.All)
# plt.yticks(df.K) # plt.yticks(df.All[::5]) = every 5 
# plt.yscale('log')
# plt.legend()








# plt.plot(df.D, df.K, 'r.-', label="One")
# plt.plot(df.D, df.K,'b.-', label="All")

# plt.plot(df.One, df.K, 'r.-', label="One")
# plt.plot(df.All, df.K,'b.-', label="All")

# df.columns = ['All', 'One']
# sns.countplot(hue='All', x='K', data=df, palette='magma')
# # sns.pairplot(data=df)
# # sns.pairplot(x='All', y='One', data=df)
# plt.title('Survivors')
# plt.show()

# series = pd.read_csv('trav.csv', header=0, index_col=0, parse_dates=True, squeeze=True)
# series.hist()
# plt.show()



# sns.kdeplot(df.All[df.K=='M'], label='men', shade=True)
# sns.kdeplot(df.One[df.K=='W'], label='women', shade=True)
# plt.xlabel('split_frac');



# g = sns.PairGrid(df, hue="All")
# g.map_diag(plt.hist)
# # g.map_offdiag(plt.scatter)
# g.add_legend();







# countplot (
# x: NoneType=None,
# y: NoneType=None,
# hue: NoneType=None,
# data: NoneType=None,
# order: NoneType=None,
# hue_order: NoneType=None,
# orient: NoneType=None,
# color: NoneType=None,
# palette: NoneType=None,
# saturation: float=0.75,
# dodge: bool=True,
# ax: NoneType=None,
# **kwargs
# )


# city_count  = df['All Dimensions'].value_counts()
# city_count = city_count[:10,]
# plt.figure(figsize=(10,5))
# sns.barplot(city_count.index, city_count.values, alpha=0.8)
# plt.title('Starbucks in top 10 cities in the World')
# plt.ylabel('Number of Occurrences', fontsize=12)
# plt.xlabel('city', fontsize=12)
# plt.show()


# traverse = pd.read_csv('traverse.csv')
# print(traverse.head())
# traverse.columns = ['All Dimensions','One Dimension']
# sns.pairplot(data=traverse, hue='All Dimensions', palette="Set2")


# create plot
# sns.countplot(x = 'class', hue = 'who', data = titanic, palette = 'magma')
# plt.title('Survivors')
# plt.show()








