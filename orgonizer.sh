#!/bin/bash

map=$(ls -d $HOME/*/)

echo " Hello , Where you want to orgonize ?"
echo "$map"
printf "PLS WRITE ADDRESS FOR DIR YOU WANT TO ORGONIZE :"
read target

cd "$target" || { echo "Directory not found "; exit 1; }
echo ""

echo "WHAT TYPE OF FILES YOU WANT TO ORGONIZE?"
find . -maxdepth 1 -type f | sed -n 's/..*\.//p' | sort | uniq -c | sort -nr
echo ""
printf "TYPE FILE EXTENSION : "
read type_file
type_file="${type_file#\.}"

printf "Well and now choose name for new folder "
read new_folder

mkdir -p "$new_folder"


mv *."$type_file" "$new_folder"/ 2>/dev/null

echo "Done ! Moved all .$type_file files into $new_folder/"