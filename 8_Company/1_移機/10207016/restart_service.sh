#!/bin/bash
set -e

declare -A MAP
BACKENDS_PATH="/opt/tornado/backends"
USER_DIR_PATH="/home/elandsoft.com/$(whoami)"
MAP["1"]="$USER_DIR_PATH/SourceData-Webserver-API-2.0.jar $BACKENDS_PATH/sourcedata/SourceData-Webserver-API-2.0.jar DataMgmt.service"
MAP["2"]="$USER_DIR_PATH/Membership-1.0.jar $BACKENDS_PATH/membership/Membership-1.0.jar Membership.service"
MAP["3"]="$USER_DIR_PATH/LogApi-1.0.jar $BACKENDS_PATH/logapi/LogApi-1.0.jar LogApi.service"
MAP["4"]="$USER_DIR_PATH/WebServer-4.17.jar $BACKENDS_PATH/webserver/WebServer-4.17.jar WebServer.service"

echo "(1)SourceDataWebserver (2)Membership (3)LogApi (4)WebServer"
read -rp "Choose the service you want to restart : " choose

NEW_JAR=$(echo "${MAP["$choose"]}" | awk '{print $1}')
OLD_JAR=$(echo "${MAP["$choose"]}" | awk '{print $2}')
SERVICE_NAME=$(echo "${MAP["$choose"]}" | awk '{print $3}')

if [ ! -e "$NEW_JAR" ]; then
	echo "error"
	exit
fi

sudo -u tornado rm -f "$OLD_JAR"
sudo -u tornado cp "$NEW_JAR" "$OLD_JAR"
sudo systemctl restart "$SERVICE_NAME"
rm -f "$NEW_JAR"
echo "done"
