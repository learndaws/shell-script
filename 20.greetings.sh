#!/bin/bash

NAME=""
WISHES=""

while getopts ":n:w:h" opt; 
do 
    case $opt in
        n) NAME="$OPTARG";;
        w) WISHES="$OPTARG";;
    esac
done

echo "Hello $NAME, $WISHES"