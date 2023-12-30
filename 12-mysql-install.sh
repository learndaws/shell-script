#!/bin/bash

ROOTACCESSCHECK=$(id -u)

if [ $ROOTACCESSCHECK -eq 1000 ]
then
echo "you have normal access"
fi