#!/bin/bash

FILE_PATH="/tmp/shell-scripts"

if [ ! -d $FILE_PATH ]
then
    echo "file doesn't exist"
fi

FILE_TO_DELETE=$(find $FILE_PATH -type f -mtime +10 -name "*.ja")

while IFS= read -r line
do 
    
    rm $line
    echo "Deleted file: $line"
done <<< $FILE_TO_DELETE


