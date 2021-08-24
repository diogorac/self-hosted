#!/bin/bash

now=$(date +"%s")
mkdir -p backup

BACKUP_FOLDER="backup/backup_$now"
BACKUP_DB="db_$now.bak"
mkdir -p $BACKUP_FOLDER

# Turn on Maintenance Mode
echo "$now | Turning on maintenance mode for Nextcloud..."
docker exec --user www-data nextcloud php occ maintenance:mode --on
echo "Done"
echo

# Backup DB
echo "$now | Backing up Nextcloud database..."
docker exec nextcloud_db bash -c "PGPASSWORD=\"$POSTGRES_PASSWORD\" pg_dump nextcloud -U nextcloud -f nextcloud.bak"
docker cp nextcloud_db:/nextcloud.bak $BACKUP_FOLDER/$BACKUP_DB.bak
echo "Done"
echo

# Backup files
echo "$now | Backing up Nextcloud files..."
docker cp nextcloud:/var/www/html $BACKUP_FOLDER
echo "Done"
echo 

# Turn off Maintenance Mode
echo "Turning off maintenance mode for Nextcloud..."
docker exec --user www-data nextcloud php occ maintenance:mode --off
echo "Done"
echo
