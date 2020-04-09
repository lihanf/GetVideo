# !/bin/bash

echo Enter the name of downloaded content
read NAME
export NAME


BASEDIR=$(dirname "$0")
echo $BASEDIR
echo "Download..."
sh $BASEDIR/Download.sh
echo "Concatenating..."
sh $BASEDIR/Concatenation.sh
echo "Deleting..."
sh $BASEDIR/Deleting.sh
echo $NAME Download completed.
unset NAME
# unset newplayspeed
# unset newPTS