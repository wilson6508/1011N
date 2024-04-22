#!/bin/bash
set -e

declare -A MAP
BACKENDS_PATH="/opt/tornado/backends"
USER_DIR_PATH="/home/elandsoft.com/$(whoami)"
MAP["1"]="$USER_DIR_PATH/Membership-1.0.jar $BACKENDS_PATH/membership/Membership-1.0.jar Membership.service"
MAP["2"]="$USER_DIR_PATH/insight-server-2.0.jar $BACKENDS_PATH/webserver/insight-server-2.0.jar WebServer.service"
MAP["3"]="$USER_DIR_PATH/CustomerReport.jar $BACKENDS_PATH/customerreport/CustomerReport.jar CustomerReport.service"
MAP["4"]="$USER_DIR_PATH/NotifyService.jar $BACKENDS_PATH/notifyservice/NotifyService.jar NotifyService.service"
MAP["5"]="$USER_DIR_PATH/followreportbackend-0.0.1-SNAPSHOT.jar $BACKENDS_PATH/followreport/followreportbackend-0.0.1-SNAPSHOT.jar FollowReport.service"
MAP["6"]="$USER_DIR_PATH/ScheduleDownload.jar $BACKENDS_PATH/scheduledownload/ScheduleDownload.jar ScheduleDownload.service"

NEW_JAR=$(echo "${MAP["$1"]}" | awk '{print $1}')
OLD_JAR=$(echo "${MAP["$1"]}" | awk '{print $2}')
SERVICE_NAME=$(echo "${MAP["$1"]}" | awk '{print $3}')

if [ ! -e "$NEW_JAR" ]; then
	echo "error"
	exit
fi

sudo -u tornado rm -f "$OLD_JAR"
sudo -u tornado cp "$NEW_JAR" "$OLD_JAR"
sudo systemctl restart "$SERVICE_NAME"
rm -f "$NEW_JAR"