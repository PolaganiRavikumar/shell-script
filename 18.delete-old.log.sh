#!/bin/bash
SOURCE_DIR=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR $G Exits $N"
else
    echo -e "$SOURCE_DIR $R doesnot exits going to create directory$N"
    sudo mkdir -p $SOURCE_DIR
fi 

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
echo "Files: $FILES"

while IFS= read -r file
do
    echo "Deleting file: $file"
    rm -rf $file
done <<< $FILES
