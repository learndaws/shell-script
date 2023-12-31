#!/bin/bash

ROOTACCESSCHECK=$(id -u)


EXIT_CHECK() 
{
    if [ $1 != 0 ];
        then
            echo "$2"
            exit 1
        else
            echo "$3"
fi
}

EXIT_CHECK "$ROOTACCESSCHECK" "FAILURE-1: you don't have root access" "SUCCESS-1: you have root access"


yum install mysql -y

EXIT_CHECK "$?" "FAILURE-2: Mysql installation is failed" "SUCCESS-2: Mysql installation is success"


yum install git -y
EXIT_CHECK "$?" "FAILURE-3: git installation is failed" "SUCCESS-3: git installation is success"