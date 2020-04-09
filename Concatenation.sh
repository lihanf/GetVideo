# #!/bin/bash

# ------------ output directory and name ------------
output='~/Downloads/outputdir'

input=$NAME

eval $"cd ~/Downloads/$input"
eval $"mkdir $output"
echo $input
for f in ./*.ts; do 
	eval $"echo "file '$f'" >> mylist.txt"
done

eval $"~/Downloads/ffmpeg -f concat -safe 0 -i mylist.txt -c copy $output/$input.mp4"
eval $"rm mylist.txt"

# ------------ audio filter ------------
# eval $"./ffmpeg -i $output/$input.mp4 -filter:a \"atempo=$newplayspeed\" -vn $output/${input}_${newplayspeed}.mp4"

#------------ complex filter ------------
# eval $"~/Downloads/ffmpeg -i $output/$input.mp4 -filter_complex \"[0:v]setpts=$newPTS*PTS[v];[0:a]atempo=$newplayspeed[a]\" -map \"[v]\" -map \"[a]\" $output/${input}_${newplayspeed}.mp4"
