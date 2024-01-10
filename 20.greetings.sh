#!/bin/bash

NAME=""
WISHES=""

while getopts ":n:w:h" opt; 
do 
    case $opt in
        n) NAME="$OPTARG";;
        W) WISHES="$OPTARG";;
        h|*) exit;;
    esac
done

echo "Hello $NAME, $WISHES"