FROM ubuntu:20.04

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -yqq install wget software-properties-common
RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key
RUN apt-key add winehq.key
RUN add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
RUN apt-get -yqq install libc6:i386
RUN apt-get -yqq install wine32
RUN apt-get -yqq install wine64
RUN apt-get -yqq install nodejs npm
ADD . /app
RUN cd /app && npm install 

