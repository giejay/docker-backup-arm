#!/bin/bash
type ./pre-backup.sh && ./pre-backup.sh
rsync -av --delete --exclude 'web/vendor' --exclude 'node_modules' /input/* /mnt/webdav/$output
echo $(date)
