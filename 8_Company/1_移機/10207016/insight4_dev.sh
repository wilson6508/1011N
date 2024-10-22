#!/bin/bash
set -e

declare -A MAP
MAP["1"]="insightDailyReport"
MAP["2"]="insightLab"
MAP["3"]="insightLogin"
MAP["4"]="insightMain"
MAP["5"]="insightObservation"
echo "(1)insightDailyReport (2)insightLab (3)insightLogin (4)insightMain (5)insightObservation"
read -rp "" choose

USER_DIR="/home/elandsoft.com/$(whoami)/Release_2/${MAP["$choose"]}"
cd "$USER_DIR" && mv "$(ls | awk '{print $1}')" ROOT.war

TARGET_DIR="/opt/tornado/backends/c/webapps/Release_2/${MAP["$choose"]}"
cd "$TARGET_DIR" && sudo -u tornado rm -rf ./*
sudo -u tornado cp "$USER_DIR/ROOT.war" .
rm "$USER_DIR/ROOT.war"
echo "done"