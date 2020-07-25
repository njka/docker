# nk
# 2017-10-03
# emby-server image


# based on image from local repo
FROM njka/baseline-16.04
MAINTAINER njka <njka.github@gmail.com>


# use ARG for variables that are only required when building the image
# (i.e. aren't needed by containers running the image)
# apparently setting DEBIAN_FRONTEND is against 'best practices'
# ARG DEBIAN_FRONTEND=noninteractive


# use ENV for variables required when building and/or running the image


# update base system and then install wget so we can add the emby repo key
# and install ffmpeg (which emby-server requires but doesn't install)
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget ffmpeg


# add emby repo and key
COPY emby-server.list /etc/apt/sources.list.d/
RUN wget -nv http://download.opensuse.org/repositories/home:emby/xUbuntu_16.04/Release.key -O Release.key
RUN apt-key add - < Release.key


# refresh repo data install emby-server and tzdata packages
RUN apt-get update && apt-get install -y emby-server tzdata


# start emby server
# CMD service emby-server start
# ENTRYPOINT service emby-server restart && /bin/su -
ENTRYPOINT service emby-server restart && /bin/su -
