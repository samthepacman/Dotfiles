#!/bin/bash

# Directory paths
downloads_dir="$HOME/Downloads"
destination_dir="$HOME/Organized"
misc_dir="$destination_dir/misc"

# File extensions and corresponding destination folders
declare -A extensions
extensions["txt"]="Text"
extensions["doc"]="Documents"
extensions["docx"]="Documents"
extensions["xls"]="Spreadsheets"
extensions["xlsx"]="Spreadsheets"
extensions["ppt"]="Presentations"
extensions["pptx"]="Presentations"
extensions["pdf"]="PDF"
extensions["jpg"]="Images"
extensions["png"]="Images"
extensions["gif"]="Images"
extensions["mp3"]="Music"
extensions["mp4"]="Videos"
extensions["tar"]="Archives"
extensions["gz"]="Archives"
extensions["bz2"]="Archives"
extensions["xz"]="Archives"
extensions["zip"]="Archives"
extensions["7z"]="Archives"
extensions["iso"]="ISOs"
extensions["py"]="Coding"
extensions["java"]="Coding"
extensions["cpp"]="Coding"
extensions["h"]="Coding"
extensions["deb"]="DEBs"
extensions["rpm"]="RPMs"
extensions["exe"]="EXEs"
extensions["apk"]="APKs"
extensions["bin"]="Binary"
extensions["flatpakref"]="Flatpakref"

# Create destination folders if they don't exist
for folder in "${extensions[@]}"; do
    if [[ ! -d "$destination_dir/$folder" ]]; then
        mkdir -p "$destination_dir/$folder"
    fi
done

# Create misc folder if it doesn't exist
if [[ ! -d "$misc_dir" ]]; then
    mkdir -p "$misc_dir"
fi

# Move files to appropriate folders
for file in "$downloads_dir"/*; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file")
        extension="${filename##*.}"
        destination_folder="${extensions[$extension]}"

        if [[ -n "$destination_folder" ]]; then
            mv "$file" "$destination_dir/$destination_folder"
            echo "Moved $filename to $destination_folder"
        fi
    fi
done

# Move remaining folders to misc folder
for folder in "$downloads_dir"/*/; do
    if [[ -d "$folder" ]]; then
        foldername=$(basename "$folder")
        if [[ ! -d "$destination_dir/$foldername" ]]; then
            mv "$folder" "$misc_dir"
            echo "Moved folder $foldername to misc"
        fi
    fi
done
