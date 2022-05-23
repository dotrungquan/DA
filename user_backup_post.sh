#!/bin/sh

#set this as needed
RESELLER=admin

BACKUP_PATH=`echo $file | cut -d/ -f1,2,3,4`
REQUIRED_PATH=/home/$RESELLER/admin_backups

if [ "$BACKUP_PATH" = "$REQUIRED_PATH" ]; then
   if [ "`echo $file | cut -d. -f4,5`" = "tar.gz" ]; then
       NEW_FILE=`echo $file | cut -d. -f1,2,3`.`date +%F-%Hh-%Mp`.tar.gz
       if [ -s "$file" ] && [ ! -e "$NEW_FILE" ]; then
           mv $file $NEW_FILE
       fi
   fi
fi
exit 0;
