import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from pandas import DataFrame , read_csv


brute = pd.read_csv('brute.csv')
brute.columns = ['Brute','Optimised', 'K', 'D']







#################################################################################
#			Dataset testing sorting vs partition 
#################################################################################


bd4 = brute[brute['D']==8]


labels = [
'K=3', 'K=3', 
'K=7', 'K=7'
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
rects1 = ax.bar(x - width/2, bd4.Brute, width,   label='Brute Force', color='#1e6dae')
rects2 = ax.bar(x + width/2, bd4.Optimised, width, label='The Fully Optimised KNN via k-d Trees', color='#6baee6')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Performance in milliseconds.')
ax.set_title('Computing K-Nearest Neighbours with Brute Force versus\n Fully Optimised k-d Trees, for D=8 and K 3 and 7')
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



bd4 = brute[brute['D']==8]


labels = [
'K=3', 'K=3', 
'K=7', 'K=7'
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
rects1 = ax.bar(x - width/2, bd4.Brute, width,   label='Brute Force', color='#1e6dae')
rects2 = ax.bar(x + width/2, bd4.Optimised, width, label='The Fully Optimised KNN via k-d Trees', color='#6baee6')

# Add some text for labels, title and custom x-axis tick labels, etc.
ax.set_ylabel('Performance in milliseconds.')
ax.set_title('Computing K-Nearest Neighbours with Brute Force versus\n Fully Optimised k-d Trees, for D=8 and K 3 and 7')
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




































































