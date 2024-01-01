#!/bin/bash

ROOTACCESSCHECK=$(id -u)


EXIT_CHECK() 
{
    if [ $1 != 0 ];
        then
            echo "FAILURE-2: $2 failed"
            exit 1
        else
            echo "SUCCESS-2: $2 success"
fi
}

EXIT_CHECK "$ROOTACCESSCHECK" "root access"


yum install mysql -y

EXIT_CHECK "$?" "Mysql installation"


yum install git -y
EXIT_CHECK "$?" "git installation"