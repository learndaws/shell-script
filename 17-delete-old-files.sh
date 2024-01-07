#!/bin/bash

FILE_PATH="/tmp/shell-scripts"

if [ ! -d $FILE_PATH ]
then
    echo "file doesn't exist"
fi

FILE_TO_DELETE=$(find $FILE_PATH -type f -mtime +10 -name "*.j*")

while IFS= read -r line
do 
    echo "Deleting file: $line"
    rm $line
    echo "Deleted file: $line"
done <<< $FILE_TO_DELETE


