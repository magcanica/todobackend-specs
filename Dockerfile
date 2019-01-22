FROM ubuntu:trusty
MAINTAINER Ashley Beecher <ashley.beecher@gmail.com>


ENV TERM=xterm-256color

# RUN sed -i "s/http:\/\/archive./http:\/\/nz.archive./g" /etc/apt/sources.list

RUN apt-get install
RUN apt-get update

RUN apt-get install curl -y

RUN apt-get install nodejs -y

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

RUN apt-get install npm -y

RUN npm set registry http://registry.npmjs.org/

COPY . /app
WORKDIR /app

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g mocha && \
    npm install -g n

RUN n stable    

RUN npm i mocha-jenkins-reporter

RUN npm install chai

RUN npm install --save bluebird

RUN npm i superagent-promise

RUN npm install superagent

RUN npm i chai-as-promised

ENTRYPOINT ["mocha"]    