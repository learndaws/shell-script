#!/bin/bash

while IFR=":" read -r user_name password user_id group_id GECOS home_dir shell
do 
    echo "username: $user_name"
    echo "password: $password" 
    echo "user-id: $user_id"
    echo "group-id: $group_id" 
    echo "GECOS: $GECOS" 
    echo "home-dir: $home_dir" 
    echo "shell: $shell"
done < /etc/passwd