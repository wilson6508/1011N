#!/bin/sh

YEAR=$(date +%Y)
MONTH=$(date +%m)

if [ $MONTH -eq 1 ]
then
    PREV_MONTH=12
    YEAR=$(($YEAR - 1))
else
    PREV_MONTH=$(($MONTH - 1))
fi

if [ $PREV_MONTH -lt 10 ]
then
    PREV_MONTH=0$PREV_MONTH
fi

DIR=/home/hello/logs/
FILES=$(ls $DIR | grep ^$YEAR$PREV_MONTH.*\.log$)
cd $DIR; rm -f $FILES

echo done