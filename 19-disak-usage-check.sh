#!/bin/bash

INPUT=$(df -hT | grep -vE 'mpfs|File')
DISK_THRESHOLD=1
message=""

while IFS= read line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')
        if [ $usage -ge $DISK_THRESHOLD ];
        then        
            message+="Higher disk usageon $partition: $usage\n"
        fi 
done <<< $INPUT 