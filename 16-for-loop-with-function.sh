#!/bin/bash

FIRST=$1
SECOND=$2

FUNCTION() 
{
for PRINT_1TO5 in {1..${FIRST}}
do
    echo "Number: ${PRINT_1TO5}"
done
}

FUNCTION
