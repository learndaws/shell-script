#!/bin/bash

B="\e[30m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


CH_SUDO_XS=$(id -u)

VALIDATE()
{
   if [ $1 != 0 ];
then
    echo -e "$2"
    exit 1
else
    echo -e "$3"
fi 
}

VALIDATE "${CH_SUDO_XS}" "${R} FAILURE-1: You don't have sudo access ${N}" "${G} SUCCESS-1: You have sudo access ${N}"


SOFTWARE_INSTALL()
{
   if [ $1 != 0 ];
    then
        yum install $2
        VALIDATE "$?" "$SOFTWARE install failed" "$SOFTWARE install success"
    else
        echo -e "$3"
    fi 
}

for SOFTWARE in $@
do 
    yum list installed ${SOFTWARE}
    SOFTWARE_INSTALL "$?" "${SOFTWARE}" "${SOFTWARE} is already installed"
done