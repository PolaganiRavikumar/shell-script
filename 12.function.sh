#!/bin/bash

USERID=$(id -u)

CHECK_ROOT()
{
    if [ $USERID -ne 0 ]
    then
        echo "please run this script with script with root priveliges"
        exit 1
    fi
}
VALIDATE()
{
    if [ $1 -ne 0 ]
    then
        echo "$2 is failed"
        exit 1
    else
        echo "$2 is success"
    fi
}

CHECK_ROOT

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "my sql is not installed going to install"
    dnf install mysql -y
    VALIDATE $? "installing mysql"
else
    echo "mysql is already installed nothing to do.."
fi