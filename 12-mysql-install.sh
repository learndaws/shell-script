#!/bin/bash

ROOTACCESSCHECK=$(id -u)

if [ $ROOTACCESSCHECK -ne 0 ]
then
echo "you don't have root access to run the script"
exit 1
fi

PRGM1=$1

yum install $PRGM -y

if [ $? -ne 0 ]
then
echo "installation failed"
exit 1
else
echo "installation is success"
fi