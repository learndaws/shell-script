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

for SOFTWARE in $@
do 
    yum list installed ${SOFTWARE}
        if [ $? != 0 ];
        then
            yum install ${SOFTWARE} -y
                if [ $? != 0 ];
                then 
                    echo "${SOFTWARE} installation failed"
                else 
                    echo "${SOFTWARE} installation success"
                fi
        fi     
done