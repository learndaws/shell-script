#!/bin/bash

INPUT_FILE=$(cat /etc/passwd)

while IFS=':' read -r user_name password user_id group_id GECOS home_dir shell
do 
    echo "username: $user_name" &>> file.log
    echo "password: $password" 
    echo "user-id: $user_id"
    echo "group-id: $group_id" 
    echo "GECOS: $GECOS" 
    echo "home-dir: $home_dir" 
    echo "shell: $shell"
done <<< $INPUT_FILE