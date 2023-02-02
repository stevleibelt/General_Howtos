# Docker and cronjobs

## Howto - notes

* create a file containing your cronjobs
* IMPORTANT, an empty line is required at the end of the cronjob file to make it a valid cron file
* the cronfile needs to be executable (0644 minimum)

## Example Dockerfile

```bash
#example cron file >>my_cron<<
* * * * * echo "Hello world" >> /var/log/cron.log 2>&1
# An empty line is required at the end of this file for a valid cron file.
```

```bash
FROM debian:latest

MAINTAINER artodeto@bazzline.net

#install cron
RUN apt-get update && apt-get -y install cron

#copy your >>my_cron<< into the cron directory
COPY my_cron /etc/cron.d/my_cron

#make it executable
RUN chmod 0644 /etc/cron.d/my_cron

#create a log file
RUN touch /var/log/cron.log

#run cron and tail the log file
CMD cron && tail -f /var/log/cron.log
```

## Links

* [scheduling tasks with cron on docker - 2017](https://jonathas.com/scheduling-tasks-with-cron-on-docker/)
* [how to run a cron job inside a docker container - 2016-05-26](https://stackoverflow.com/questions/37458287/how-to-run-a-cron-job-inside-a-docker-container#37458519)
* [Cronjos in docker container](https://forums.docker.com/t/cronjobs-in-docker-container/2618)
* [Running multiple services in a container](https://docs.docker.com/config/containers/multi-service_container/)
* [Docker supervisor tutorial](https://gotechnies.com/docker-supervisor-tutorial/)

