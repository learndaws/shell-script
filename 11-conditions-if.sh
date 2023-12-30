#!/bin/bash

NUMERICAL=$1

if [$NUMERICAL -gt 100]
then
    echo "$NUMERICAL is grater than 100"
else
    echo "$NUMERICAL is less than 100"
fi