#!/bin/bash

INPUT=$(df -hT | grep -vE 'mpfs|File' | awk '{print $6F}' | cut -d % -f1)
PARTITION_NAME=$(df -hT | grep -vE 'tmpfs|File' | awk '{print $1F}')

while IFS= read -r line
do
    if [  $line -ge 1 ];
    then
        usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
        partition=$(echo $line | awk '{print $1F}')
        echo "$PARTITION_NAME:$line:crossed threshold"
    else
        echo "$PARTITION_NAME:$line:under threshold"
fi 
done <<< $INPUT 