#!/bin/bash

B="\e[30m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

PREVIOUS_COMMAND_CHECK()
{
	if [ $1 -ne 0 ];
		then
			echo -e "${R} $2 is FAILED  ${N}" 2>&1 | tee -a ${LOG}
			exit 1
		else
			echo -e "${G} $3 is SUCCESS  ${N}" 2>&1 | tee -a ${LOG}
	fi
}


SUDO_CHECK=$(id -u)

DATE=$(date +%F)

LOG="Jenkins_intall_${DATE}.log"


PREVIOUS_COMMAND_CHECK $? "FAILED-1: SUDO CHECK" "SUCCESS-1: SUDO CHECK"


if [ ${SUDO_CHECK} -ne 0 ];
	then 
		echo -e "${R} FAILURE-2: You don't have sudo access ${N}" 2>&1 | tee -a ${LOG}
		exit 1
	else
		echo -e "${G} SUCCESS-2: You have sudo access ${N}" 2>&1 | tee -a ${LOG}
fi


yum update -y 2>&1 | tee -a ${LOG}


PREVIOUS_COMMAND_CHECK $? "FAILED-3: YUM update" "SUCCESS-3: YUM update"


sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo 2>&1 | tee -a ${LOG}
	
	
PREVIOUS_COMMAND_CHECK $? "FAILED-4: Jenkins repo install" "SUCCESS-4: Jenkins repo install"


rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key 2>&1 | tee -a ${LOG}


PREVIOUS_COMMAND_CHECK $? "FAILED-5: Jenkins key install" "SUCCESS-5: Jenkins key install"


yum upgrade 2>&1 | tee -a ${LOG}


PREVIOUS_COMMAND_CHECK $? "FAILED-6: YUM upgrade" "SUCCESS-6: YUM upgrade"


yum install java-17-amazon-corretto -y 2>&1 | tee -a ${LOG}


PREVIOUS_COMMAND_CHECK $? "FAILED-7: Java install" "SUCCESS-7: Java install"


yum install jenkins -y 2>&1 | tee -a ${LOG}


PREVIOUS_COMMAND_CHECK $? "FAILED-8: Jenkins install" "SUCCESS-8: Jenkins install"


systemctl enable jenkins 2>&1 | tee -a ${LOG}


PREVIOUS_COMMAND_CHECK $? "FAILED-9: Jenkins service enable" "SUCCESS-9: Jenkins service enable"


systemctl start jenkins 2>&1 | tee -a ${LOG}


PREVIOUS_COMMAND_CHECK $? "FAILED-10: Jenkins service start" "SUCCESS-10: Jenkins service start"

pwdd 2>&1 | tee -a ${LOG}


PREVIOUS_COMMAND_CHECK $? "FAILED-11: pwd" "SUCCESS-11: pwd"


pwd 2>&1 | tee -a ${LOG}


PREVIOUS_COMMAND_CHECK $? "FAILED-12: pwd" "SUCCESS-12: pwd"
