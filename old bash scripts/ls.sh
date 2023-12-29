if [ -z "$(ls -A */)" ]; then
    echo ""
    echo "No directories found"

else
    for dir in */
    do
        dirArr+=("$dir")
    done
    # print directories
    suffix="/"
    echo ""
    echo "Directories"
    echo "-------------"
    for d in ${dirArr[@]}
    do  
        echo "$((i+1)). ${d%$suffix}"
        i=$((i+1))
    done
    echo ""
    read -p "Choose Directory: " inputDir

    if [ -z "$inputDir" ]; then
        echo ""
        echo "No directory selected, try again dumbass"
        echo ""
    else 
        echo ""
        cd ${dirArr[inputDir-1]}
    fi
fi


# reset counter
i=0
unset dirArr
