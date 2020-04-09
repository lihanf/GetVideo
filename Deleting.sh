# Delete download files

# eval $"cd ~/Downloads/$NAME"


# # ------------ deleting .ts files ------------
# for f in ./*.ts; do
# 	echo "Deleting File $f" 
# 	eval $"rm $f"
# done

# # ------------ deleting .download files ------------
# for f in ./*.download; do
# 	echo "Deleting File $f"
# 	eval $"rm -r $f"
# done

eval $"cd ~/Downloads/"

# eval $"rm -r $NAME"
eval "mv $NAME ~/.Trash"
echo Moved $NAME to Trash