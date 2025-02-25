#!/bin/bash

CONFIG_PATH=/data/options.json
PAIR="$(jq --raw-output '.pair' $CONFIG_PATH)"
CONFIGURE="$(jq --raw-output '.configure' $CONFIG_PATH)"
DRIVER="$(jq --raw-output '.driver' $CONFIG_PATH)"
LATITUDE="$(jq --raw-output '.latitude' $CONFIG_PATH)"
LONGITUDE="$(jq --raw-output '.longitude' $CONFIG_PATH)"
ALTITUDE="$(jq --raw-output '.altitude' $CONFIG_PATH)"
ALTITUDEUNIT="$(jq --raw-output '.altitudeUnit' $CONFIG_PATH)"
LOCATION="$(jq --raw-output '.location' $CONFIG_PATH)"
UNITS="$(jq --raw-output '.units' $CONFIG_PATH)"
MQTT_HOST=$(bashio::services mqtt "host")

if [ "$CONFIGURE" == 'true' ]
then
  weectl station create /data --driver=$DRIVER --latitude=$LATITUDE --longitude=$LONGITUDE --altitude=$ALTITUDE,$ALTITUDEUNIT --location=$LOCATION --units=$UNITS --no-prompt --config=/config/weewx.conf
fi

if [ "$PAIR" == 'true' ]
then
  weectl device --pair --config=/config/weewx.conf
fi

if [ "$CONFIGURE" == 'false' ]
then
  weewxd /config/weewx.conf
fi
#sleep infinity