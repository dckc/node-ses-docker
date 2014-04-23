FROM debian:jessie
MAINTAINER Dan Connolly <dckc@madmode.com>

RUN apt-get update && apt-get install -y g++ make curl tar
RUN apt-get install -y python

RUN cd /usr/local/src; curl http://nodejs.org/dist/v0.10.26/node-v0.10.26.tar.gz | tar xzf -

RUN cd /usr/local/src; cd node*; ./configure; make install

RUN apt-get -y purge g++ make
RUN apt-get -y autoremove

