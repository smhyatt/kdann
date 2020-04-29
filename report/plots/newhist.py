
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from pandas import DataFrame , read_csv



def truncate(n):
    return int(n * 1000) / 1000


# onev2 = pd.read_csv('visit-one-k3-d16.csv')
# allv2 = pd.read_csv('visit-all-k3-d16.csv')

onev2 = pd.read_csv('visit-one-k5-d6.csv')
allv2 = pd.read_csv('visit-all-k5-d6.csv')





onev2.columns = ['One']
allv2.columns = ['All']


alltrunc = [truncate(i*0.001) for i in onev2.One]
onetrunc = [truncate(i*0.001) for i in allv2.All]

np_hist3 = onetrunc


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
ax.set_yscale('log')
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



np_hist4 = alltrunc
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
ax.set_yscale('log')
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





