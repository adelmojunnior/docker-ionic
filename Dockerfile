FROM node:14.7.0-slim

LABEL maintainer="adelmo<adelmo@contato.io>"

ENV TZ=America/Bahia \
    IONIC_VERSION=4.5.0 \
    CORDOVA_VERSION=10.0.0 \
    NODE_SASS=4.14.1

RUN apt-get update &&  \
    apt-get install -y apt-utils bzip2 git wget curl unzip python gcc g++ make

RUN npm i -g cordova@"$CORDOVA_VERSION" --unsafe-perm \
    npm i -g ionic@"$IONIC_VERSION" --unsafe-perm \
    npm i -g node-sass@"$NODE_SASS" --unsafe-perm \
    npm cache clear --force

RUN echo $TZ > /etc/timezone && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata 

RUN echo 'strict-ssl=false' > ~/.npmrc
RUN git config --global url."https://".insteadOf git://

