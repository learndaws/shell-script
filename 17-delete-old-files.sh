#!/bin/bash

FILE_PATH="/tmp/shell-scripts"

if [ ! -d $FILE_PATH ]
then
    echo "file doesn't exist"
fi

FILES_TO_DELETE="$(find $FILE_PATH -type f -mtime +10 -name "*.log")"

while IFS= read -r line
do 
    echo "Deleting file: $line"
done <<< $FILE_TO_DELETE


