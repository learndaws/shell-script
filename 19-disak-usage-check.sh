#!/bin/bash

DISK_USAGE_CHECK=$(df -hT | grep -vE 'mpfs|File' | awk '{print $6F}' | cut -d % -f1)
echo "$DISK_USAGE_CHECK"

if ($DISK_USAGE_CHECK -ge 1);
then
    echo "crossed threshold"
else
    echo "under threshold"
fi 