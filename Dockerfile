FROM node:14.7.0-slim

LABEL maintainer="adelmo<adelmo@contato.io>"

RUN apt-get update && apt-get install --no-install-recommends -y sudo python gcc g++ make bzip2 git \
    && npm config set cache /cache/.npm/  \
    && sudo npm i -g npm@6.14.7 --unsafe-perm \
    && sudo npm i -g node-sass@4.14.1 --unsafe-perm \
    && sudo npm i -g ionic@4.5.0 --unsafe-perm \
    && apt-get -y remove python gcc g++ make \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install --no-install-recommends -y wget
RUN echo 'strict-ssl=false' > ~/.npmrc
RUN git config --global url."https://".insteadOf git://

