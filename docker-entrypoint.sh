#!/usr/bin/env bash
set -e

# do envsubst on kamailio main config
cp -a /etc/kamailio /tmp
cat /tmp/kamailio/kamailio.cfg | envsubst > /tmp/kamailio/kamailio.cfg.new
mv /tmp/kamailio/kamailio.cfg.new /tmp/kamailio/kamailio.cfg

# now start the kamailio
exec "$@"
