#!/bin/bash


CH_SUDO_XS=$(id -u)


VALIDATE()
{
   if [ $1 != 0 ]
then
    echo "$2"
else
    echo "$3"
fi 
}


VALIDATE "${CH_SUDO_XS}" "You don't have sudo access" "You have sudo access"


yum install git -y

VALIDATE "$?" "git installation failed" "git installation successful"

