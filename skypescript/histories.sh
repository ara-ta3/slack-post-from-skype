#!/bin/sh

s=`dirname $0`
jq=$s/../lib/jq
token=`cat $s/../token`
oldest=`cat $s/latest`

result=`curl 'https://slack.com/api/channels.history' \
    -s \
    -X POST \
    -d token="$token" \
    -d oldest="$oldest" \
    -d channel="C02H3TZ1N"`


settingFile=$s/../setting.json
if [ ! -f $settingFile ]; then
    echo "NoSettings"
    exit 1
fi

getDefaultName() {
    echo "NoSettings"
}

getTargetName() {
    name=`cat $settingFile|$jq .slackNames.${1}|xargs echo`
    if [ $name == 'null' ]; then
        name=`getDefaultName`
    fi
    echo $name
}

length=`echo $result|$jq ".messages|length"`
if [ $length -gt 0 ]; then
    oldest=`echo $result|$jq '.messages[0].ts'`
    nameAndTexts=`echo $result|$jq '.messages|map(.subtype != "bot_message")|map(.user + ","+ .text)|.[]|tostring'`
    for nameAndText in $nameAndTexts; do
        text=`echo $nameAndText|xargs echo`
        vals=( `echo $text | tr -s ',' ' '`)
        user=`getTargetName ${vals[0]}`
        message=${vals[1]}
        sh $s/post.sh $user $message
    done
    echo $oldest > $s/latest
else
    echo "No Messages"
    echo $result
fi


