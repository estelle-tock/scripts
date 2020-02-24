#!/bin/sh

if [ $# -lt 2 ]; then
    echo "[ERROR] enter valid input arguments."
    echo "[ERROR] ./removeheaders.sh <path_to_zip_file> <name_of_destination_file>"
    exit 1
fi

echo "[LOG] source zip file: $1"
echo "[LOG] destination: $2"

echo "[LOG] creating destination file $2..."
touch "$2"

# unzip folder with all files
echo "[LOG] unzipping file zip file... $1"
unzip $1 -d temp

# go into folder
echo "[LOG] files in zipped folder... (ls temp)"
ls temp

echo "[LOG] removing __MACOSX from temp folder..."
rm -rf temp/__MACOSX

checkHeaders() {
	# check if the headers all match
	echo "[LOG] checking if headers of all files match... (loop through each file & check first line)"
	i=1;
	previous_headers=``
	for file in temp/*
	do
		echo "[LOG] file #$i: $file"
		

		if [ "$i" -eq 1 ] 
		then
		   	previous_headers=`head -n 1 $file`
		else
		   	current_headers=`head -n 1 $file`
		   	if [ "$previous_headers" != "$current_headers" ] 
		   	then 
		   		echo "[ERROR] headers in one of the files does not match others"
				echo "[ERROR] check $file"
				exit 1				
			fi
		   	previous_headers="$current_headers"
		fi
		((i++))
		
	done
	echo "[LOG] SUCCESS all headers match!"
}

concat() {
	echo "[LOG] merging files into one..."

	i=1;
	for file in temp/*
	do
		if [ "$i" -eq 1 ]
		then
			echo "[LOG] copying file $file with headers into $1..."
			cp $file "$1"
		else
			echo "[LOG] copying file $file without headers into $1..."
			echo "$(tail -n +2 $file; echo '')" >> "$1"
		fi
		((i++))
	done
}

checkHeaders
concat "$2"

echo "[LOG] SUCCESS merging files into $2"
echo "Total number of lines: $(wc -l $2)"

# clean up temp dir
rm -rf temp

exit 1
