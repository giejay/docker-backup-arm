#!/bin/bash
echo "backup to /mnt/webdav/$output"
type ./pre-backup.sh && ./pre-backup.sh
rsync -av --delete --exclude 'web/vendor' --exclude 'node_modules' --no-owner --no-group /input/* /mnt/webdav/$output
echo $(date)
