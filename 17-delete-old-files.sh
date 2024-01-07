#!/bin/bash

FILE_PATH="/tmp/file-1.log"

if [ ! -f ${FILE_PATH} ];
then
    echo "file doesn't exist"
else 
    rm ${FILE_PATH}
fi


