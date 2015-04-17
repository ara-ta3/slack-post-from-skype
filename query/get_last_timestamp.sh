#!/bin/sh

s=`dirname $0`
last=`echo 'select timestamp from Messages where chatname = "#a.macbee/$kay_t_arata;139ebf66853db51f" order by id desc limit 1;'|sqlite3 ~/Library/Application\ Support/Skype/aratabot/main.db`
echo $last > ${s}/last_timestamp
