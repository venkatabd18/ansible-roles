#!/bin/bash

USERID=$(id -u)

CHECK_ROOR(){
    if [ $USERID -ne 0 ]
    then
        echo "Run the script with root access"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is FAILED. Pls checke"
        exit 1
    else
        echo "$2 is success"
    fi    
}

CHECK_ROOR

echo "Script started on: $(date)"

dnf list installed ansible
if [ $? -ne 0 ]
then
    echo "Ansible not installed. installing now"
    VALIDATE
else
    echo "Ansible already installed. nothing to do
fi