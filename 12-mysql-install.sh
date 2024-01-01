#!/bin/bash

ROOTACCESSCHECK=$(id -u)


EXIT_CHECK() 
{
    if [ $1 != 0 ];
        then
            echo "FAILURE-2: $3"
            exit 1
        else
            echo "SUCCESS-2: $2"
fi
}

EXIT_CHECK "$ROOTACCESSCHECK" "you don't have root access" "you have root access"


yum install mysql -y

EXIT_CHECK "$?" "Mysql installation is success" "Mysql installation is failed"


yum install git -y
EXIT_CHECK "$?" "git installation is success" "git installation is failed"