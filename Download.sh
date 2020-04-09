#!/bin/bash

echo Enter urlprefix \(everything before xxxxx.ts\)
read urlprefix

echo Enter the index of the first file \(integer\)
read mini

echo Enter the index of the last file \(integer\)
read maxi


CURRTIME=$(date +%m%d%k%M)


niter=3
for ((iter=0;iter<$niter;iter++))
do
	for((i=$mini;i<$maxi;i++))
	do
		num="$i"
		zeros=''
		for((j=0;j<5-"${#num}";j++)){
			zeros+='0'
		}
		filename=~/Downloads/${NAME}/${zeros}${i}.ts
		if [[ -f "$filename" ]]; then
			FMODIFYTIME=$(stat -f "%Sm" -t "%m%d%k%M" $filename)
			if [[ "$FMODIFYTIME" > "$CURRTIME" ]]; then
				eval $"rm -r $filename"
			fi
			unset FMODIFYTIME
		fi
		
		if [[ ! -f "$filename" ]]; then
			fullurl="${urlprefix}${zeros}${i}.ts"

			# if [ -d ${filename}*.download ]; then
			# 	for file in ${filename}*.download; do	
			# 		eval $"rm -r $file" 
			# 	done
			# fi
			# FINISH=0
			# open -g -a "Safari" $fullurl    Opening in browser
			
			echo "Downloading file: ${zeros}${i}.ts (iter: $iter)"
			wget -c --retry-connrefused --timeout=10 -P ~/Downloads/$NAME $fullurl  # 2>&1 | egrep -i "404"

			# sleep $(expr $RANDOM % 4 + 1)
		fi
	done
done

