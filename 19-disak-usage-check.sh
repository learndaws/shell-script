#!/bin/bash

DISK_USAGE_CHECK=$(df -hT | grep -vE 'mpfs|File' | awk '{print $6F}' | cut -d % -f1)
PARTITION_NAME=$(df -hT | grep -vE 'tmpfs|File' | awk '{print $1F}')

while IFS= read -r line
do
    if [  $line -le 1 ];
    then
        echo "$PARTITION_NAME:$line:crossed threshold"
    else
        echo "$PARTITION_NAME:$line:under threshold"
fi 
done <<< $DISK_USAGE_CHECK 