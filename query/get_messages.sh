#!/bin/sh

while :
do
    s=`dirname $0`
    last=`cat $s/last_timestamp`
    q="select from_dispname||'('||author||')',body_xml from Messages where chatname = '#a.macbee/\$kay_t_arata;139ebf66853db51f' and timestamp > $last;"
    echo $q|sqlite3 ~/Library/Application\ Support/Skype/kay_t_arata/main.db >> $s/../messages
    sh $s/get_last_timestamp.sh
    sleep 2
done

