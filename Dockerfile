FROM debian:jessie
MAINTAINER Dan Connolly <dckc@madmode.com>

# TODO: combine several of these steps into one to avoid committing intermediate steps
RUN apt-get update && apt-get install -y g++ make curl tar
RUN apt-get install -y python

RUN cd /usr/local/src; curl http://nodejs.org/dist/v0.10.26/node-v0.10.26.tar.gz | tar xzf -

RUN cd /usr/local/src; cd node*; ./configure; make install

RUN apt-get -y purge g++ make
RUN apt-get -y autoremove

RUN cd /usr/local/src; rm -rf node*

RUN npm install -g ses

# shebang with args doesn't work on linux.
RUN sed -i '1c\#!/usr/local/bin/node --harmony' /usr/local/lib/node_modules/ses/bin/ses
