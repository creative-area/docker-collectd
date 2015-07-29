#!/bin/bash
set -e

echo "Taking a nap, to allow network to properly set up.."
sleep 60
echo "That was a good nap. Now to work..."

sed -i "s/{{LOGSTASH_SERVER}}/$LOGSTASH_SERVER/g" "$COLLECTD_PATH/etc/collectd.conf"
sed -i "s/{{LOGSTASH_PORT}}/$LOGSTASH_PORT/g" "$COLLECTD_PATH/etc/collectd.conf"
sed -i "s/{{HOSTNAME}}/$HOSTNAME/g" "$COLLECTD_PATH/etc/collectd.conf"
sed -i "s:{{COLLECTD_PATH}}:$COLLECTD_PATH:g" "$COLLECTD_PATH/etc/collectd.conf"

exec "$COLLECTD_PATH/sbin/collectd" -f
