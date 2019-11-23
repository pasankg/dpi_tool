#!/bin/bash
# Author - Pasan Gamage
# 23-11-2019
# Read files from a directory and show image files with dpi less than 300
# Dependant on exiftool

# Use current directory path
current_dir=$PWD
# Xdpi to check
dpiX=300

# For each file in path execute
find $current_dir -name "*.*" | while read f ; do
	# Check if file extention is jpg or png
	if [[ ${f: -4} == ".jpg" || ${f: -4} == ".png" ]]; then
		# Rename files by replacing spaces with underscores
		mv -- "$f" "${f// /_}"

		# Print the information
		# echo file name: $(basename "${f%.*}") --- file type: "${f##*.}" --- DPI: $(exiftool -b "${f}" -XResolution), $(exiftool -b "${f}" -YResolution)

		# Print only smaller dpi files
		if [[ ($(exiftool -b "${f}" -XResolution) -lt $dpiX) ]]; then
			# echo file name: $(basename "${f%.*}") --- file type: "${f##*.}" --- dpi: $(exiftool -b "${f}" -XResolution), $(exiftool -b "${f}" -YResolution) --- file path: $f
			echo file name: $(basename "${f%.*}") --- file type: "${f##*.}" --- dpi: $(exiftool -b "${f}" -XResolution), $(exiftool -b "${f}" -YResolution) --- file path: $f >> dpi_log.txt
		fi
	fi
done