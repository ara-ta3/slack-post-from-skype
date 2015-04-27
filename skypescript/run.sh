#!/bin/sh

while :
do
    s=`dirname $0`
    sh $s/histories.sh
    sleep 10
done

