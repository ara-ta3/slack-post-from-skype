#!/bin/sh

s=`dirname $0`
jq=$s/../lib/jq
settingFile=$s/../setting.json
if [ ! -f $settingFile ]; then
    echo "NoSettings"
    exit 1
fi

getDefaultIcon() {
    cat $settingFile|$jq .names.none.icon|xargs echo
}

getTargetIcon() {
    cat $settingFile|$jq .names.${1}.icon|xargs echo
}

noIcon=`getDefaultIcon`
target=`echo $1|sed -e 's/\.//g'`
icon=`getTargetIcon $target`
if [ $icon == "null" ]; then
    icon=$noIcon
fi
echo $icon
