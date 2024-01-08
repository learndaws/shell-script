#!/bin/bash

DISK_USAGE_CHECK=$(df -hT | grep -vE 'mpfs|File' | awk '{print $6F}' | cut -d % -f1)

while IFS= read -r line
do
    if [  $line -le 1 ];
    then
        echo "$line:crossed threshold"
    else
        echo "$line:under threshold"
fi 
done <<< $DISK_USAGE_CHECK 