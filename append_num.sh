#!/bin/bash

for i in `seq 0.1 0.2 0.9`;
do
	echo $i
	cat img/single-app/dyn-eff-$i.txt | awk '{print i++ " " $0}' | awk '{ print $1,$2,(1/$3)-1,(1/$4)-1,(1/$5)-1,(1/$6)-1,(1/$7)-1,(1/$8)-1 ;}' > img/image_text/dyn-eff-$i.txt 
	#cat img/single-app/dyn-eff-$i.txt | awk '{print i++ " " $0}' | awk '{ print $1,$2,(1/$3)-1,(1/$4)-1,(1/$5)-1,(1/$6)-1,(1/$7)-1,(1/$8)-1 ;}' 
	cat img/single-app/dyn-mape-$i.txt | awk '{print i++ " " $0}' > img/image_text/dyn-mape-$i.txt 
	cat img/multi-app/ma-eff-$i.txt | awk '{print i++ " " $0}' | awk '{ print $1,$2,(1/$3)-1,(1/$4)-1,(1/$5)-1 ;}'> img/image_text/ma-eff-$i.txt 
	cat img/multi-app/ma-err-$i.txt | awk '{print i++ " " $0}' > img/image_text/ma-err-$i.txt 

done
cat img/x264-native-ducks/better-results.txt | awk '{print i++ " " $0}'  > img/image_text/x264-native-ducks-better-results.txt 
cat img/accuracy.txt | awk '{print i++ " " $0}' > img/image_text/accuracy.txt 

