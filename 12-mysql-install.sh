#!/bin/bash

ROOTACCESSCHECK=$(id -u)

if [ $ROOTACCESSCHECK -ne 0 ]
then
echo "you don't have root access to run the script"
fi
yum install mysql