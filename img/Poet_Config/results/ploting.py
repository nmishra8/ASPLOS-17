#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb 23 23:49:44 2017

@author: nmishra
"""

import numpy as np
import pandas as pd
from tabulate import tabulate
import matplotlib.pyplot as plt
from collections import defaultdict
import matplotlib
import colorlover as cl
from IPython.display import HTML
HTML(cl.to_html( cl.flipper()['seq']['3'] ))
matplotlib.style.use('ggplot')

Colors   = ['blue','green','red','cyan', 'magenta', 'beige', 
            'bisque', 'black', 'dimgray','darkturquoise','blanchedalmond','darkviolet']

deadline = ['0.60','0.65','0.70','0.75','0.80','0.85','0.90']
table    = []
All_data = defaultdict(dict)
for x in ['eff','lat']:
    for y in deadline:
        filename = '../results/single-app/dyn-' + x +'-' +y  +'-v3.txt'
        f        = open(filename, 'r')  
        table    = [row.strip().split('\t')[0].split() for row in f if 'AVERAGE']
        All_data[x][y]= np.array([table[i][1:] for i in range(1,len(table)-1)]).astype(float)
        f.close()
        
algorithms = table[0][1:]
benchmarks = np.array(table)[1:-1,0]

def rgb_to_hex(rgb):
    if type(rgb) is tuple:
        
        return '#' '%02x%02x%02x' % tuple([int(item) for item in list(rgb)])
    elif type(rgb) is list:
        return [rgb_to_hex(item) for item in rgb]
    
algorithms_arranged = ['OPTIMAL',
                                             'RACE',
                                             'CONTROL',
                                             'ONLINE',
                                             'OFFLINE',
                                             'NUCLEAR',
                                             'HBM',
                                             
                                             'CALOREE-NP',
                                             'ADAPT-CONTROL',
                                             'ONLINE-ADAPT',
                                             'NUCLEAR-ADAPT',
                                             'HBM-ADAPT']
reds = rgb_to_hex(cl.to_numeric(cl.scales['6']['seq']['Reds']))
reds.reverse()
BuPus  = rgb_to_hex(cl.to_numeric(cl.scales['6']['seq']['BuPu']))
greens = rgb_to_hex(cl.to_numeric(cl.scales['3']['seq']['Greens']))

# plot eff
means_deadline = pd.DataFrame([],columns = algorithms_arranged)
for item in deadline:    
    df = pd.DataFrame(All_data['eff'][item], columns = algorithms)
    means_deadline = means_deadline.append(df.mean(),ignore_index=True)
    
means, errors = means_deadline.mean(), means_deadline.std()
fig, ax = plt.subplots()
means.plot.bar(yerr=errors, ax=ax, color = reds+BuPus+greens)

# plot latency
means_deadline = pd.DataFrame([],columns = algorithms_arranged)
for item in deadline:    
    df = pd.DataFrame(All_data['lat'][item], columns = algorithms)    
    means_deadline = means_deadline.append(df.mean(),ignore_index=True)
    
means, errors = means_deadline.mean(), means_deadline.std()
fig, ax = plt.subplots()
means.plot.bar(yerr=errors, ax=ax, color = reds+BuPus+greens)

# plot all
fig, ax = plt.subplots()
df = pd.DataFrame(All_data['eff']['0.90'], columns = algorithms, index=benchmarks)
df.plot.bar( ax=ax,  legend = False, color = reds+BuPus+greens)
