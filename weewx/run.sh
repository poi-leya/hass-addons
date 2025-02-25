#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

PAIR="$(bashio::config 'pair')"
CONFIGURE="$(bashio::config 'configure')"
DRIVER="$(bashio::config 'driver')"
LATITUDE="$(bashio::config 'latitude')"
LONGITUDE="$(bashio::config 'longitude')"
ALTITUDE="$(bashio::config 'altitude')"
ALTITUDEUNIT="$(bashio::config 'altitudeUnit')"
LOCATION="$(bashio::config 'location')"
UNITS="$(bashio::config 'units')"

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
  sed -i 's/MQTT_HOST/'$(bashio::services mqtt "host")':'$(bashio::services mqtt "port")'/g' /config/weewx.conf
  weewxd /config/weewx.conf
fi
