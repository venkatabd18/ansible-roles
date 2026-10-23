#!/bin/bash

USERID=$(id -u)
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Run the script with roor access"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is FAILED. Pls check"
        exit 1
    else
        echo "$2 is SUCCESS"
    fi
}

CHECK_ROOT

echo "Script execution time is : $(date)"


dnf list install ansible
if [ $? -ne 0 ]
then 
    echo "Ansible not installed. installing now"
    dnf install ansible -y
    VALIDATE $? "install ansible"
else
    echo "Ansible already installed. nothing to do"
fi