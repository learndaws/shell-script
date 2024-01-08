#!/bin/bash

INPUT=$(df -hT | grep -vE 'mpfs|File')
DISK_THRESHOLD=1
message=""

while IFS= read -r line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')
        if [ $usage -ge 1 ];
        then        
            message+="Higher disk usage on $partition: $usage\n"
        fi 
done <<< $INPUT 

echo -e "Message: \n$message"