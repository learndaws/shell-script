#!/bin/bash

INPUT=$(df -hT | grep -vE 'mpfs|File' | awk '{print $6F}' | cut -d % -f1)

while IFS= read -r line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')
        if [  $line -ge 1 ];
        then
        
            echo "$line:crossed threshold"
        else
            echo "$line:under threshold"
    fi 
done <<< $INPUT 