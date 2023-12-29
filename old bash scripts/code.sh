cd projects/
echo ""
i=0
suffix="/"

# send all directories to an array
for dir in */
do
    dirArr+=("$dir")
done


# print directories
echo "Projects"
echo "-------------"
for d in ${dirArr[@]}
do     
    echo "$((i+1)). ${d%$suffix}"
    i=$((i+1))
done

# read
echo ""
read -p "Choose Project: " inputDir

if [ -z "$inputDir" ]; then
    echo ""
    echo "No Project Selected, try again dumbass"
    echo ""
else
    cd ${dirArr[inputDir-1]}
    code .
fi

i=0
unset dirArr