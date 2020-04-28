
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



# plt.bar([1], [940, 1000], 1, label="", color='#12446d')
# plt.bar([2.5], [940, 1200], 1, label="CUDA", color = '#1e6dae')
# plt.bar([4], [3178, 3000], 1, label="C", color='#6baee6')
# plt.yscale('log')
# plt.legend()
# plt.xticks([])
# # plt.xlabel('Comparison between Futhark, CUDA and the Sequential Performances.')
# plt.ylabel('Logarithmic scale of the runtime microseconds.')
# plt.title('Performances of Block and Register \n Tiled Batch Matrix-Matrix Multiplication')
# plt.show()


# data = [[30, 25, 50, 20],
# [40, 23, 51, 17],
# [35, 22, 45, 19]]
X = np.arange(18)
# X = ['C', 'C++', 'Java', 'Python', 'PHP']
fig = plt.figure()
ax = fig.add_axes([0,0,1,1])
ax.bar(X + 0.00, data[0], color='#12446d', width = 0.25)
ax.bar(X + 0.25, data[1], color = '#1e6dae', width = 0.25)
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



X2 = np.arange(0, 18, 1)

diff = pd.read_csv('diffs.csv')
diff.columns = ['Diff','K', 'D']

plt.figure(figsize=(10,5))
plt.title('Time differences in running Prime-Numbers Computation sequentially \n and parallel with both a flat and not-flat implementation.') 
# plt.xscale('log')
# plt.yscale('log')
plt.xlabel('Ten test runs.')
plt.ylabel('The runtime.') 

# plt.xticks()
# plt.yticks()
plt.yscale('log')

# plt.plot(X2, naivc, linestyle='-', label = "primes-naive w/ C")
plt.plot(X2, diff.Diff, linestyle='-.', label = "primes-naive w/ OpenCL")

# plt.plot(X2, flatc, linestyle='-', label = "primes-flat w/ C")
# plt.plot(X2, alld, linestyle='-.', label = "primes-flat w/ OpenCL")

# plt.plot(X2, seqc, linestyle='-', label = "primes-seq w/ C")

plt.legend()
plt.show()




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
plt.show()








