#!/bin/bash

READ_FILE=$(cat 14-IP-Addresses)

while IFS= read -r line
do 
    nslookup $line | grep name &>> /tmp/new.log 

done <<< $READ_FILE