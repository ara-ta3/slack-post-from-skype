#!/bin/bash

token=`cat ../token`
while read line
do
    name=`echo $line|jq .name`
    text=`echo $line|jq .text`
    curl https://slack.com/api/chat.postMessage \
        -X POST \
        -d token="$token" \
        -d channel="#vg14crew" \
        -d username="$name" \
        -d text="$text"
done < /dev/stdin



