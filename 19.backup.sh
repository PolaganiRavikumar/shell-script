#!/bin/bash
SOURCE_DIR=$1
DES_DIR=${2}
DAYS=${3:-14}
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
USAGE()
{
   echo -e "$R USAGE:: $N sh 19.backup.sh <source> <destination> <days(optional)>"
}
# check the source and destination is provided 
if [ $# -lt 2 ]
then 
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exits ...please check"
fi
if [ ! -d $ DES_DIR ]
then
    echo "$ DEST_DIR does not exits ..please check"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
echo "Files: $FILES"
if [ ! -z $FILES ]
then
    echo "Files are found"
    ZIP_FILE= "$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime + $DAYS | zip "$ZIP_FILE" -@
    if [ -f $ZIP_FILE ]
    then
        echo "successfully zipped files older then $DAYS"
        while IFS= read -r file
        do 
            echo "Deleting file: $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "Zipping file is failed"
        exit 1
    fi
else
    echo "No files older than $DAYS"
fi