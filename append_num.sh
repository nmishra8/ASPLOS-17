#!/bin/bash

for i in `seq 0.1 0.2 0.9`;
do
	echo $i
	cat img/single-app/dyn-eff-$i.txt | awk '{print i++ " " $0}' > img/image_text/dyn-eff-$i.txt 
	cat img/single-app/dyn-mape-$i.txt | awk '{print i++ " " $0}' > img/image_text/dyn-mape-$i.txt 
	cat img/multi-app/ma-eff-$i.txt | awk '{print i++ " " $0}' > img/image_text/ma-eff-$i.txt 
	cat img/multi-app/ma-err-$i.txt | awk '{print i++ " " $0}' > img/image_text/ma-err-$i.txt 

done
#cat img/x264-native-ducks/leo.txt | awk '{print i++ " " $0}' > img/image_text/x264-native-ducks-leo.txt 
#cat img/x264-native-ducks/leopoet.txt | awk '{print i++ " " $0}' > img/image_text/x264-native-ducks-leopoet.txt 
#cat img/x264-native-ducks/poet.txt | awk '{print i++ " " $0}' > img/image_text/x264-native-ducks-leo.txt 
cat img/accuracy.txt | awk '{print i++ " " $0}' > img/image_text/accuracy.txt 


#if []
#	then
#cat img/single-app/dyn-eff-$i.txt | awk '{print i++ " " $0}' > img/image_text/dyn-eff-$i.txt 
#cat img/single-app/dyn-mape-$i.txt | awk '{print i++ " " $0}' > img/image_text/dyn-mape-$i.txt 

#cat img/multi-app/ma-eff-$i.txt | awk '{print i++ " " $0}' > img/image_text/ma-eff-$i.txt 
#cat img/multi-app/ma-err-$i.txt | awk '{print i++ " " $0}' > img/image_text/ma-err-$i.txt 

