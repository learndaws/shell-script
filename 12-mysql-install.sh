#!/bin/bash

ROOTACCESSCHECK=$(id -u)

if [ $ROOTACCESSCHECK -ne 0 ]
then
echo "run the script with root access user"
fi