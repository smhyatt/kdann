
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from pandas import DataFrame , read_csv




def truncate(n):
    return int(n * 1000) / 1000





##########################################################################################################################################
#                   FOR K=5 AND D=6 AND D=16
##########################################################################################################################################




# onev = pd.read_csv('visit-one-k5-d6.csv')
# allv = pd.read_csv('visit-all-k5-d6.csv')

onev = pd.read_csv('visit-one-k5-d16.csv')
allv = pd.read_csv('visit-all-k5-d16.csv')

onev.columns = ['One']
allv.columns = ['All']

alltrunc = allv.All
onetrunc = onev.One

np_hist = alltrunc



hist,bin_edges = np.histogram(np_hist)

fig, ax = plt.subplots()
n, bins, patches = ax.hist(x=np_hist, bins=10, color='#12446d',alpha=0.7, rwidth=0.85, label='K=5 \nD=16') #6')
ax.set_xlabel('Number of Visits.')
ax.set_title('The Number of Visits while Checking All Dimensions,\n on a Datasets of sizes 1048576') # 4194304')
ax.set_ylabel('Number of Occurrences in logarithmic scale.')
ax.set_xticks(bins)
ax.set_yscale('log')
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






np_hist2 = onetrunc
hist,bin_edges = np.histogram(np_hist2)

fig, ax = plt.subplots()

n, bins, patches = ax.hist(x=np_hist2, bins=10, color='#12446d',alpha=0.7, rwidth=0.85, label='K=5 \nD=16') # 6')
print(bins)

ax.set_xlabel('Number of Visits.')
ax.set_title('The Number of Visits while Checking One Dimension,\n on a Datasets of sizes 1048576') # 4194304')
ax.set_ylabel('Number of Occurrences in logarithmic scale.')
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






##########################################################################################################################################
#                   FOR K=3 AND D=8 AND D=16
##########################################################################################################################################


# onev2 = pd.read_csv('visit-one-k3-d8.csv')
# allv2 = pd.read_csv('visit-all-k3-d8.csv')

onev2 = pd.read_csv('visit-one-k3-d16.csv')
allv2 = pd.read_csv('visit-all-k3-d16.csv')


onev2.columns = ['One']
allv2.columns = ['All']


alltrunc = allv2.All
onetrunc = onev2.One

np_hist3 = onetrunc


hist,bin_edges = np.histogram(np_hist3)
fig, ax = plt.subplots()

n, bins, patches = ax.hist(x=np_hist3, bins=10, color='#12446d',alpha=0.7, rwidth=0.85, label='K=3 \nD=16') #8')
print(bins)

ax.set_xlabel('Number of Visits.')
ax.set_title('The Number of Visits while Checking One Dimension,\n on a Datasets of sizes 2097152') # 1048576')
ax.set_ylabel('Number of Occurrences in logarithmic scale.')
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
fig, ax = plt.subplots()

n, bins, patches = ax.hist(x=np_hist4, bins=10, color='#12446d',alpha=0.7, rwidth=0.85, label='K=3 \nD=16') #8')
print(bins)

ax.set_xlabel('Number of Visits.')
ax.set_title('The Number of Visits while Checking All Dimensions,\n on a Datasets of sizes 2097152') # 1048576')
ax.set_ylabel('Number of Occurrences in logarithmic scale.')
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











