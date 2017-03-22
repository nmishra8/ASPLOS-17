import pandas as pd
import numpy as np
extn = ["{0:.2f}".format(item/100) for item in list(range(65,95,5))]
arr  = ("single-app/dyn-eff","single-app/dyn-lat","multi-app/ma-eff","multi-app/ma-lat")

for i in extn:
    for j in arr:
        var = j.split('/')

        inputt='img/' + j +'-' +i+ '-v3.txt'
        output='img/image_text/' + var[1] + '-' + i+'-v3.txt'
        #print(i, j, var )
        #print('--',var)
        #print(var[0], var[1])
        #print(i, j, inputt, output, var )

        f        = open(inputt, 'r')  
        table    = [row.strip().split('\t')[0].split() for row in f if 'AVERAGE']
        All_data = np.array([table[i][1:] for i in range(1,len(table)-1)]).astype(float)

        tmp = j.split('-')
        if tmp[0] == 'single' and tmp[2] == 'lat':
            All_data = 100*All_data
        f.close()
        
        algorithms = table[0][1:]
        benchmarks = np.append(np.array(table)[0:-1,0], 'AVERAGE')

        final_data= np.round(np.vstack((All_data,All_data.mean(0))), decimals=2)
    #benchmarks = np.append(benchmarks, 'AVERAGE')
    #tablee = np.round(pd.DataFrame(All_data, columns = algorithms,index=benchmarks))
    #tablee.to_csv('output.txt',sep=',',skipinitialspace=True);

        a = np.vstack((algorithms,final_data ))
        b = np.column_stack((benchmarks,a))
        df = pd.DataFrame(b)
        df.to_csv(output,header=False, sep=' ')