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

for INSTALLATION_LOOP in $@
do 
    yum list installed ${INSTALLATION_LOOP}
    VALIDATE "$?" "${R} FAILURE: ${INSTALLATION_LOOP} is not stalled ${N}" "${G} SUCCESS: ${INSTALLATION_LOOP} is already stalled ${N}"
done

