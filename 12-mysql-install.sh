#!/bin/bash

ROOTACCESSCHECK=$(id -u)


EXIT_CHECK() 
{
    if [ $1 != 0 ];
        then
            echo "FAILURE-2: $2"
            exit 1
        else
            echo "SUCCESS-2: $3"
fi
}

EXIT_CHECK "$ROOTACCESSCHECK" "you don't have root access" "you have root access"


yum install myql -y

EXIT_CHECK "$?" "Mysql installation is failed" "Mysql installation is success"


yum install git -y
EXIT_CHECK "$?" "git installation is failed" "git installation is success"