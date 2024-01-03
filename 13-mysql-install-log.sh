#!/bin/bash

ROOTACCESSCHECK=$(id -u)


DATE=$(date +%F)

LOG="/tmp/$0-${DATE}.log"  #even this also can be done LOG="/tmp/$0-${DATE}.log".. saves the file under tmp folder and $0 shows the name of the file


EXIT_CHECK() 
{
    if [ $1 != 0 ];
        then
            echo "$2"  &>> ${LOG}
            exit 1
        else
            echo "$3"  &>> ${LOG}
fi
}

EXIT_CHECK "$ROOTACCESSCHECK" "FAILURE-1: you don't have root access" "SUCCESS-1: you have root access"


yum install mysql -y  &>> ${LOG}

EXIT_CHECK "$?" "FAILURE-2: Mysql installation is failed" "SUCCESS-2: Mysql installation is success"


yum install git -y  &>> ${LOG}
EXIT_CHECK "$?" "FAILURE-3: git installation is failed" "SUCCESS-3: git installation is success"