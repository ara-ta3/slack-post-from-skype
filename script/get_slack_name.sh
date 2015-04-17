#!/bin/sh

s=`dirname $0`
jq=$s/../lib/jq
settingFile=$s/../setting.json
if [ ! -f $settingFile ]; then
    echo "NoSettings"
    exit 1
fi

getDefaultName() {
    cat $settingFile|$jq .names.none.name|xargs echo
}

getTargetName() {
    cat $settingFile|$jq .names.${1}.name|xargs echo
}

noName=`getDefaultName`
target=`echo $1|sed -e 's/\.//g'`
name=`getTargetName $target`
if [ $name == "null" ]; then
    name=$noName
fi
echo $name
