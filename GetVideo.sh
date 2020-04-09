# !/bin/bash

echo Enter the name of downloaded content
read NAME
export NAME


BASEDIR=$(dirname "$0")
echo $BASEDIR
echo "Download..."
sh $BASEDIR/Download.sh
# osascript -e 'tell app "System Events" to display dialog "'Download\ complete\ for\ ${NAME}.\ Proceed\ to\ Concatenation?'"'
if [ $? == 0 ]; then
	echo "Concatenating..."
	sh $BASEDIR/Concatenation.sh
	# osascript -e 'tell app "System Events" to display dialog "'Concatenation\ complete\ for\ ${NAME}.\ Proceed\ to\ Deleting?'"'
	if [ $? == 0 ]; then
		echo "Deleting..."
		sh $BASEDIR/Deleting.sh
		echo $NAME Download completed.
	fi

fi
unset NAME
# unset newplayspeed
# unset newPTS