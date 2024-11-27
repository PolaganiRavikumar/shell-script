#!/bin/bash
DISK-USAGE=$(df-hT | grep xfs)
DISK_THRESHOLD=5
while IFS= read -r file
do
    USAGE=$(echo $line | grep xfs |awk -f " " '{print $6F}'| cut -d "%" -f1)
    PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo " $PARTITION is more than $DISK_THRESHOLD, Current value: $USAGE. please check"
    fi
done <<< $DISK_USAGE