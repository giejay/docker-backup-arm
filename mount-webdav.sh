rm -f /var/run/mount.davfs/mnt-webdav.pid
echo "$webdavurl $user $password" > /etc/davfs2/secrets
printenv | sed 's/^\(.*\)$/export \1/g' | grep -E "^export output" > /root/project_env.sh
mount -t davfs $webdavurl /mnt/webdav
