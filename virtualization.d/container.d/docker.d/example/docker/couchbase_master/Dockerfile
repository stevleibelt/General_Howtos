####
#for learn cli configuration
# @see:
#   https://github.com/couchbase/docker/tree/fc55b9efd80129ab73373f94f9066186932e563e/community/couchbase-server/5.1.1
#   https://developer.couchbase.com/documentation/server/5.5/install/init-setup.html
#   https://developer.couchbase.com/documentation/server/5.5/install/getting-started-docker.html#topic_mln_twc_3w
#   https://developer.couchbase.com/documentation/server/5.5/sdk/sample-application.html
####
# @since 2018-08-14
# @author stev leibelt <artodeto@bazzline.net>
####

FROM couchbase:community-5.1.1

LABEL maintainer="artodeto@bazzline.net"

#docker run -d --name my_db --ulimit nofile=40960:40960 --ulimit core=100000000:100000000 --ulimit memlock=100000000:100000000 --name db -p 8091-8094:8091-8094 -p 11210:11210 couchbase
#docker run --name my_master_couchbase -it couchbase:community-5.1.1 /bin/bash
#docker run --name my_slave_couchbase -it couchbase:community-5.1.1 /bin/bash
RUN apt-get update \
    && apt-get dist-upgrade
RUN couchbase-cli cluster-init \
    --cluster my_cluster \
    --cluster-username devuser \
    --cluster-password tb1111 
    \ --debug
#begin of installing stuff to fetch from git repository, to make composer work
RUN apk update \ 
    && apk upgrade \ 
    && apk add git \ 
    && apk add openssh-client \ 
    && mkdir /root/.ssh \ 
    && mkdir /application
COPY ssh /root/.ssh
WORKDIR /application
#end of installing stuff to fetch from git repository, to make composer work

####
#@see:
#   https://stackoverflow.com/questions/40894385/how-can-i-install-the-php-memcached-extension-on-dockers-php7-alpine-image#41575677
#   https://developer.couchbase.com/documentation/server/current/sdk/php/start-using-sdk.html
#   https://gist.github.com/meridius/d91781e1eaf1f23b0643314d073d7c53
#   https://hub.docker.com/_/php/
#
#check installed modules
#   php -m
####

####
#@notes:
#   I don't know if we could remove all the dependencies we've installed after we have build the extension
####
#begin of couchbase client building
RUN apk update \ 
    && apk upgrade \ 
    && docker-php-source extract \ 
    && apk add autoconf g++ re2c lz4 gawk make libcouchbase-dev \ 
    && apk add g++ \ 
    && apk add re2c \ 
    && apk add lz4 \ 
    && apk add gawk \ 
    && apk add make \ 
    && apk add libcouchbase-dev \ 
    && pecl install igbinary-2.0.7 \ 
    && pecl install couchbase-2.4.2 \ 
    && docker-php-ext-enable igbinary \ 
    && docker-php-ext-enable couchbase \ 
    && docker-php-source delete \ 
    #&& apk del make gawk lz4 re2c g++ autoconf \   #add this line if I want to remove stuff
    && rm -fr /tmp/*
#end of couchbase client building
