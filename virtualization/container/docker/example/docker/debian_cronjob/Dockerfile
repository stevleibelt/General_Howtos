FROM debian:latest

MAINTAINER artodeto@bazzline.net

#install cron
#procps for ps
RUN apt-get update && apt-get -y install cron procps htop

#copy your >>my_cron<< into the cron directory
COPY cronjob/cronjob /etc/cron.d/cronjob

#make it executable
RUN chmod 0644 /etc/cron.d/cronjob

#create a log file
RUN touch /var/log/cronjob.log

#run cron and tail the log file
CMD chmod 0644 /etc/cron.d/cronjob && chown root:root /etc/cron.d/cronjob && cron && tail -f /var/log/cronjob.log
