FROM ubuntu:18.04
MAINTAINER Sugare
RUN apt update && apt install gcc  g++ make cmake wget software-properties-common gnupg1 -y
RUN dpkg --add-architecture i386
RUN wget -nc https://dl.winehq.org/wine-builds/Release.key && apt-key add Release.key
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 76F1A20FF987672F && apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main' 2>&1 && apt-get update
RUN apt-get install --install-recommends wine64 winehq-stable -y
EXPOSE 8090

