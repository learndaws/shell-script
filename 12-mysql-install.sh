#!/bin/bash

ROOTACCESSCHECK=$(id -u)

if [ $ROOTACCESSCHECK != 0 ];
    then
        echo "FAILURE-1: you don't have root access to run the script"
        exit 1
    else
        echo "SUCCESS-1: you have root access"
fi

yum install mysqlas -y

if [ $? != 0 ];
    then
        echo "FAILURE-2: Mysql installation failed"
        exit 1
    else
        echo "SUCCESS-2: Mysql installation success"
fi

yum install git -y

if [ $? != 0 ];
    then
        echo "FAILURE-3: git installation failed"
        exit 1
    else
        echo "SUCCESS-3: git installation success"
fi