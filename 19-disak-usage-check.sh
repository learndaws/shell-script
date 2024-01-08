#!/bin/bash

DISK_USAGE_CHECK=$(df -hT | grep -vE 'mpfs|File' | awk '{print $6F}' | cut -d % -f1)

while IFS= read -r line
do
    if [  $line -ge 1 ];
    then
        echo "crossed threshold"
    else
        echo "under threshold"
fi 
done <<< $DISK_USAGE_CHECK 