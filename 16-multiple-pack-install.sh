#!/bin/bash

B="\e[30m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


CH_SUDO_XS=$(id -u)


VALIDATE()
{
   if [ $1 != 0 ]
then
    echo -e "$2"
    exit 2
else
    echo -e "$3"
fi 
}


VALIDATE "${CH_SUDO_XS}" "${R} FAILURE-1: You don't have sudo access ${N}" "${G} SUCCESS-1: You have sudo access ${N}"


yum install git -y

VALIDATE "$?" "${R} FAILURE-2: git installation failed ${N}" "${G} SUCCESS-2: git installation successful ${N}"

