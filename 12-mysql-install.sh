#!/bin/bash

ROOTACCESSCHECK=$(id -u)

if [ $ROOTACCESSCHECK -ne 0 ]
then
echo "you don't have root access to run the script"
exit 1
fi
yum install mysql -y