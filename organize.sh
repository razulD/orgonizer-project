#!/bin/bash

map=$(ls -d $HOME/*/)
auto_organize(){
	declare -A CATEGORIES=(
        [pdf]="Documents" [txt]="Documents" [doc]="Documents" [docx]="Documents"
        [jpg]="Images"    [png]="Images"    [jpeg]="Images"   [gif]="Images"
        [mp4]="Videos"    [mkv]="Videos"    [mov]="Videos"
        [zip]="Archives"  [tar]="Archives"  [gz]="Archives"
        [mp3]="Audio"     [wav]="Audio"
    )



organize=$(basename "$0")

for file in *; do
	[ -f "$file" ] || continue 
	[ "$file" = "$organize" ] && continue  

	ext="${file##*.}"
	ext=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
	folder="${CATEGORIES[$ext]:-Others}"

	mkdir -p "$folder"
	mv "$file" "$folder/"
done
echo "AUto orgonize is done "
}


echo " Hello , Where you want to orgonize ?"
echo "$map"
printf "PLS WRITE ADDRESS FOR DIR YOU WANT TO ORGANIZE :"
read target

cd "$target" || { echo "Directory not found "; exit 1; }
echo ""

echo "WHAT TYPE OF FILES YOU WANT TO ORGANIZE? OR TYPE --auto for sorting ext into standart folders"



find . -maxdepth 1 -type f | sed -n 's/..*\.//p' | sort | uniq -c | sort -nr
echo ""
printf "TYPE FILE EXTENSION : "
read type_file
type_file="${type_file#\.}"


if [[ "$type_file" == "--auto" ]]; then
	echo "running automatic organization..."
	auto_organize
else 
	printf "Well and now choose name for new folder "
	read new_folder

	mkdir -p "$new_folder"


	mv *."$type_file" "$new_folder"/ 2>/dev/null

	echo "Done ! Moved all .$type_file files into $new_folder/"
fi
