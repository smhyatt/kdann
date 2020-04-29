
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from pandas import DataFrame , read_csv



# df = pd.read_csv('visits2.csv')
onev = pd.read_csv('visit-one-k5-d16.csv')
allv = pd.read_csv('visit-all-k5-d16.csv')

# df.columns = ['All', 'One']
onev.columns = ['One']
allv.columns = ['All']

# plt.plot(df.D, df.K, 'r.-', label="One")
# plt.plot(df.D, df.K,'b.-', label="All")

# plt.plot(df.One, 'r.-', label="One")
# plt.plot(df.All,'b.-', label="All")

# sns.countplot(x='All', hue='One', data=df, palette='magma')
# # # sns.pairplot(data=df)
# # # sns.pairplot(x='All', y='One', data=df)
# plt.title('Survivors')
# plt.show()


# plt.hist(x='One', bins=50)
# plt.ylabel('No of times')
# plt.show()

np_hist = allv.All



hist,bin_edges = np.histogram(np_hist)
print(hist)
print(bin_edges)

# labels = ['2446',  '276',  '171',  '130',  '108',  '98',   '94',   '95',  '114',  '564']

# labels = ['-1',  '104856',  '209714',  '314572',  '419429',
#   '524287',  '629145',  '734002',  '838860',  '943718',
#   '1048576']

# labels = [-1,  104856,  209714,  314572,  419429,
#   524287,  629145,  734002,  838860,  943718,
#   1048576]

# labels = [104856,  209714,  314572,  419429,
#   524287,  629145,  734002,  838860,  943718,
#   1048576]

# x = np.arange(len(labels))  # the label locations
# width = 0.4  # the width of the bars


fig, ax = plt.subplots()


# plt.figure(figsize=[10,8])
n, bins, patches = ax.hist(x=np_hist, bins=10, color='#12446d',alpha=0.7, rwidth=0.85, label='K=5 \nD=16') #, label='Visits Traversing All Dimensions.')
# n, bins, patches = plt.hist(x=np_hist, bins=12, color='#12446d',alpha=0.7, rwidth=0.85)
# n, bins, patches = plt.hist(x=np_hist, bins=8, color='#0504aa',alpha=0.7, rwidth=0.85)
# plt.grid(axis='y', alpha=0.75)
# plt.title('The Number of Visits with a Step of 64, on Traversing All Dimensions')
# plt.xlabel('Number of Occurrences.')
# plt.ylabel('Number of Visits.')
# plt.set_xticklabels(patches)
# plt.xlabel('Value',fontsize=15)
# plt.ylabel('Frequency',fontsize=15)
# plt.xticks(np.arange(0, 1, step=0.2))
# locs, labels = plt.xticks() 
# print(labels)
# plt.xticks(labels)
# plt.xticks(fontsize=15)
# plt.yticks(fontsize=15)

print(bins)

ax.set_xlabel('Number of Visits.')
ax.set_title('The Number of Visits, with a Step of 64 \n while Checking All Dimensions, on a Dataset of size 1048576')
# ax.set_yticks(k5.All)
ax.set_ylabel('Number of Occurrences.')
ax.set_xticks(bins)
# ax.set_xticks(x)
# ax.set_xticklabels(labels)
ax.legend()

def autolabel(rects):
    i = 0
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        height = rect.get_height()
        # ax.annotate('{}'.format(labels[i]),
        ax.annotate('{}'.format(height),
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')
        i += 1


autolabel(patches)


fig.tight_layout()

plt.show()






np_hist2 = onev.One
hist,bin_edges = np.histogram(np_hist2)
print(hist)
print(bin_edges)


fig, ax = plt.subplots()

n, bins, patches = ax.hist(x=np_hist2, bins=10, color='#12446d',alpha=0.7, rwidth=0.85, label='K=5 \nD=16') #, label='Visits Traversing All Dimensions.')
print(bins)

ax.set_xlabel('Number of Visits.')
ax.set_title('The Number of Visits, with a Step of 64 \n while Checking One Dimension, on a Dataset of size 1048576')
ax.set_ylabel('Number of Occurrences.')
ax.set_xticks(bins)
ax.legend()

def autolabel(rects):
    i = 0
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        height = rect.get_height()
        ax.annotate('{}'.format(height),
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')
        i += 1


autolabel(patches)

fig.tight_layout()

plt.show()





onev2 = pd.read_csv('visit-one-k3-d8.csv')
allv2 = pd.read_csv('visit-all-k3-d8.csv')

onev2.columns = ['One']
allv2.columns = ['All']

np_hist3 = onev2.One
hist,bin_edges = np.histogram(np_hist3)
print(hist)
print(bin_edges)


fig, ax = plt.subplots()

n, bins, patches = ax.hist(x=np_hist3, bins=10, color='#12446d',alpha=0.7, rwidth=0.85, label='K=3 \nD=8') #, label='Visits while Traversing and Checking one Dimensions.')
print(bins)

ax.set_xlabel('Number of Visits.')
ax.set_title('The Number of Visits while Checking One Dimension,\non a Dataset of size 1048576')
ax.set_ylabel('Number of Occurrences.')
ax.set_xticks(bins)
ax.legend()

def autolabel(rects):
    i = 0
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        height = rect.get_height()
        ax.annotate('{}'.format(height),
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')
        i += 1


autolabel(patches)

fig.tight_layout()

plt.show()


np_hist4 = allv2.All
hist,bin_edges = np.histogram(np_hist4)
print(hist)
print(bin_edges)


fig, ax = plt.subplots()

n, bins, patches = ax.hist(x=np_hist4, bins=10, color='#12446d',alpha=0.7, rwidth=0.85, label='K=3 \nD=8')
print(bins)

ax.set_xlabel('Number of Visits.')
ax.set_title('The Number of Visits while Checking All Dimensions,\non a Dataset of size 1048576')
ax.set_ylabel('Number of Occurrences.')
ax.set_xticks(bins)
ax.legend()

def autolabel(rects):
    i = 0
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        height = rect.get_height()
        ax.annotate('{}'.format(height),
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')
        i += 1


autolabel(patches)

fig.tight_layout()

plt.show()


















# plt.bar(bin_edges[:-1], hist, width = 0.5, color='#0504aa',alpha=0.7)
# plt.xlim(min(bin_edges), max(bin_edges))
# plt.grid(axis='y', alpha=0.75)
# plt.xlabel('Value',fontsize=15)
# plt.ylabel('Frequency',fontsize=15)
# # plt.xticks(fontsize=15)
# # plt.yticks(fontsize=15)
# plt.title('Normal Distribution Histogram',fontsize=15)
# plt.show()




# series = pd.read_csv('visit-all-k5-d16.csv', header=0, index_col=0, parse_dates=True, squeeze=True)
# series.hist()
# plt.show()


