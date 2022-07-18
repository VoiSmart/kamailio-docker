#!/usr/bin/env bash
set -e

# do envsubst on kamailio main kamailio-env.cfg, if exists
cp -a /etc/kamailio /tmp

if [ -f "/tmp/kamailio/kamailio-env.cfg" ]; then
  cat /tmp/kamailio/kamailio-env.cfg | envsubst > /tmp/kamailio/kamailio-env.cfg.new
  mv /tmp/kamailio/kamailio-env.cfg.new /tmp/kamailio/kamailio-env.cfg
fi

# now start the kamailio
exec "$@"
