#!/bin/sh

target='aratabot'
while :
do
    s=`dirname $0`
    last=`cat $s/last_timestamp`
    q="select author, replace(body_xml, '\\n', ' ') from Messages where chatname = '#a.macbee/\$kay_t_arata;139ebf66853db51f' and not author = '$target' and timestamp > $last;"
    echo $q|sqlite3 ~/Library/Application\ Support/Skype/$target/main.db >> $s/../messages
    sh $s/get_last_timestamp.sh
    sleep 2
done

