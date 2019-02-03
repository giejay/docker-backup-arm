echo "$webdavurl $user $password" > /etc/davfs2/secrets
mount -t davfs $webdavurl /mnt/webdav
