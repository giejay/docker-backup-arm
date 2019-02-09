FROM resin/rpi-raspbian:jessie-20161026
# Install cron
RUN apt-get update
RUN apt-get install -y cron git ssh

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/simple-cron
#ADD crontab-additional /etc/cron.d/additional-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/simple-cron
#RUN chmod 0644 /etc/cron.d/additional-cron

# Add backup script
ADD backup.sh /backup.sh
ADD pre-backup.sh /pre-backup.sh

# Give execution rights backup.sh
RUN chmod +x /backup.sh
RUN chmod +x /pre-backup.sh

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

RUN apt-get install davfs2 rsync

RUN mkdir /mnt/webdav
ADD mount-webdav.sh /mount-webdav.sh

#RUN service cron start

# Run the command on container startup
CMD bash /mount-webdav.sh && cron && sleep 15 && touch /etc/cron.d/simple-cron && : >> /var/log/cron.log && tail -f /var/log/cron.log
