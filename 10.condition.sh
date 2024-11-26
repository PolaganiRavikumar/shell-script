#!/bin/bash
Number=$1
if [ $Number -gt 20 ]
then
    echo "Given number is : $Number is greater than 20"
else 
    echo "Given number is : $Number is less than 20"
fi
