#!/bin/bash

for PRINT_1TO5 in {1..5}
do
    echo "Number: ${PRINT_1TO5}-->END OF FIRST SCRIPT"
done

#=============

FUNCTION()
{
    for ((NUMBER=1; NUMBER<=$1; NUMBER++))
    do
        echo "Number: ${NUMBER}"
    done
}

FUNCTION $1



