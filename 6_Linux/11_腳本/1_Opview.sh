#!/bin/bash
 
DEST=/opt/tornado/backend/$1
SOURCE=/home/elandsoft.com/$(whoami)
CURRENT_TIME=$(date +%Y%m%d_%H%M%S)
SERVICE_NAME=$2
FILE=$3
 
if [ -e $DEST/$FILE ]; then
  sudo -u tornado mv $DEST/$FILE $DEST/$CURRENT_TIME    
fi
 
if [ -e $SOURCE/$FILE ]; then
  sudo -u tornado cp $SOURCE/$FILE $DEST/
  rm $SOURCE/$FILE 
fi
 
sudo systemctl restart $SERVICE_NAME
echo done

#!/bin/bash
/opt/tornado/backend/deployment/main.sh notify NotifyService.service NotifyService.jar