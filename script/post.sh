#!/bin/bash

s=`dirname $0`
token=`cat $s/../token`
jq=$s/../lib/jq
while read line
do
    name=`echo $line|$jq .name`
    text=`echo $line|$jq .text`
    slackName=`sh $s/get_slack_name.sh $name`
    slackIcon=`sh $s/get_slack_icon.sh $name`
    curl https://slack.com/api/chat.postMessage \
        -X POST \
        -d token="$token" \
        -d channel="#vg14crew" \
        -d username="${slackName}(from Skype)" \
        -d icon="$slackIcon" \
        -d text="$text"
done < /dev/stdin
