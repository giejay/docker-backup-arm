rm /var/run/mount.davfs/mnt-webdav.pid
echo "$webdavurl $user $password" > /etc/davfs2/secrets
printenv | sed 's/^\(.*\)$/export \1/g' > /root/project_env.sh
mount -t davfs $webdavurl /mnt/webdav
