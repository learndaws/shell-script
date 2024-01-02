#!/bin/bash


FUNCTION() 
{
for PRINT_1TO5 in {1..$1}
do
    echo "Number: ${PRINT_1TO5}"
done
}

FUNCTION "5"
