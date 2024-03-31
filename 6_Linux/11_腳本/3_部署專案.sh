#!/bin/bash

APP_NAME=demo

tpid=`ps -ef | grep $APP_NAME | grep -v grep | grep -v kill | awk '{print $2}'`
if [ $tpid ]; then
  echo "刪除進程"
  kill -15 $tpid
fi
sleep 2

tpid=`ps -ef | grep $APP_NAME | grep -v grep | grep -v kill | awk '{print $2}'`
if [ $tpid ]; then
  echo "刪除進程"
  kill -9 $tpid
else
  echo 'Stop Success'
fi

echo "拉取遠程代碼"
cd /usr/local/hellojava
git pull

echo '開始打包'
output=`mvn clean package -Dmaven.test.skip=true`

echo "啟動項目"
cd target
nohup java -jar demo-0.0.1-SNAPSHOT.jar &> hellojava.log &
echo "done"