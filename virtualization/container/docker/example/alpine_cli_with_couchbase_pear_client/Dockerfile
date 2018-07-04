####
#for learn about management 
# @see: https://www.rabbitmq.com/management.html
#for learn about cluster configuration
# @see: https://www.rabbitmq.com/cluster-formation.html
####
# @since 2018-06-04
# @author stev leibelt <artodeto@bazzline.net>
####

FROM php:7.0-cli-alpine

LABEL maintainer="artodeto@bazzline.net"

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
    && apk add autoconf g++ re2c lz4 gawk make libcouchbase-dev \ 
    && apk add g++ \ 
    && apk add re2c \ 
    && apk add lz4 \ 
    && apk add gawk \ 
    && apk add make \ 
    && apk add libcouchbase-dev \ 
    && pecl install couchbase-2.4.2 \ 
    && docker-php-ext-enable couchbase \ 
    && docker-php-source delete \ 
    && apk del make gawk lz4 re2c g++ autoconf \ 
    && rm -fr /tmp/*
#end of couchbase client building
