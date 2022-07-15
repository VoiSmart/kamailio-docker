FROM ubuntu:focal AS base

ARG DEBIAN_FRONTEND=noninteractive

RUN rm -rf /var/lib/apt/lists/* && apt-get update &&  apt-get upgrade --assume-yes
RUN apt-get install --assume-yes gnupg wget
RUN echo "deb http://deb.kamailio.org/kamailio56 focal main" >   /etc/apt/sources.list.d/kamailio.list
RUN wget -O- http://deb.kamailio.org/kamailiodebkey.gpg | apt-key add -


FROM base

LABEL maintainer="Matteo Brancaleoni <matteo.brancaleoni@voismart.it>"

ARG DEBIAN_FRONTEND=noninteractive

VOLUME /etc/kamailio

RUN apt-get update && apt-get install --assume-yes \
  kamailio=5.6.1+ubuntu20.04 \
  kamailio-autheph-modules=5.6.1+ubuntu20.04 \
  kamailio-berkeley-bin=5.6.1+ubuntu20.04 \
  kamailio-berkeley-modules=5.6.1+ubuntu20.04 \
  kamailio-cnxcc-modules=5.6.1+ubuntu20.04 \
  kamailio-cpl-modules=5.6.1+ubuntu20.04 \
  kamailio-dbg=5.6.1+ubuntu20.04 \
  kamailio-erlang-modules=5.6.1+ubuntu20.04 \
  kamailio-extra-modules=5.6.1+ubuntu20.04 \
  kamailio-geoip-modules=5.6.1+ubuntu20.04 \
  kamailio-geoip2-modules=5.6.1+ubuntu20.04 \
  kamailio-ims-modules=5.6.1+ubuntu20.04 \
  kamailio-json-modules=5.6.1+ubuntu20.04 \
  kamailio-kazoo-modules=5.6.1+ubuntu20.04 \
  kamailio-ldap-modules=5.6.1+ubuntu20.04 \
  kamailio-lua-modules=5.6.1+ubuntu20.04 \
  kamailio-lwsc-modules=5.6.1+ubuntu20.04 \
  kamailio-memcached-modules=5.6.1+ubuntu20.04 \
  kamailio-mongodb-modules=5.6.1+ubuntu20.04 \
  kamailio-mono-modules=5.6.1+ubuntu20.04 \
  kamailio-mqtt-modules=5.6.1+ubuntu20.04 \
  kamailio-mysql-modules=5.6.1+ubuntu20.04 \
  kamailio-nth=5.6.1+ubuntu20.04 \
  kamailio-outbound-modules=5.6.1+ubuntu20.04 \
  kamailio-perl-modules=5.6.1+ubuntu20.04 \
  kamailio-phonenum-modules=5.6.1+ubuntu20.04 \
  kamailio-postgres-modules=5.6.1+ubuntu20.04 \
  kamailio-presence-modules=5.6.1+ubuntu20.04 \
  kamailio-python-modules=5.6.1+ubuntu20.04 \
  kamailio-python3-modules=5.6.1+ubuntu20.04 \
  kamailio-rabbitmq-modules=5.6.1+ubuntu20.04 \
  kamailio-radius-modules=5.6.1+ubuntu20.04 \
  kamailio-redis-modules=5.6.1+ubuntu20.04 \
  kamailio-ruby-modules=5.6.1+ubuntu20.04 \
  kamailio-sctp-modules=5.6.1+ubuntu20.04 \
  kamailio-snmpstats-modules=5.6.1+ubuntu20.04 \
  kamailio-sqlite-modules=5.6.1+ubuntu20.04 \
  kamailio-systemd-modules=5.6.1+ubuntu20.04 \
  kamailio-tls-modules=5.6.1+ubuntu20.04 \
  kamailio-unixodbc-modules=5.6.1+ubuntu20.04 \
  kamailio-utils-modules=5.6.1+ubuntu20.04 \
  kamailio-websocket-modules=5.6.1+ubuntu20.04 \
  kamailio-xml-modules=5.6.1+ubuntu20.04 \
  kamailio-xmpp-modules=5.6.1+ubuntu20.04

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT exec kamailio -DD -E