#!/bin/bash

ROOTACCESSCHECK=$(id -u)

if [ $ROOTACCESSCHECK != 0 ];
    then
        echo "FAILURE-1: you don't have root access to run the script"
        exit 1
    else
        echo "SUCCESS-1: you have root access"
fi


EXIT_CHECK() 
{
    if [ $1 != 0 ];
        then
            echo "FAILURE-2: $2 installation failed"
            exit 1
        else
            echo "SUCCESS-2: $2 installation success"
fi
}


yum install mysql -y

EXIT_CHECK "$?" "Mysql"


yum installas git -y
EXIT_CHECK "$?" "git"