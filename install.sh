# Author - Pasan Gamage
# 23-11-2019
# Install dependancy

file="Image-ExifTool-11.76.tar.gz"
if [ -f "$file" ]
then
	echo "$file found."
	echo Extracting...
	tar -xzf Image-ExifTool-11.76.tar.gz
	cd Image-ExifTool-11.76
	cp -r exiftool lib /usr/local/bin
else
	echo "$file not found."
fi
echo Yay! Sucessfully installed.