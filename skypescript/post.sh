#!/bin/bash

name=$1
text=$2
echo "
tell application \"Skype\"
    send command \"CHATMESSAGE #a.macbee/\$kay_t_arata;139ebf66853db51f $name \n$text\" script name \"skype script\"
end tell
" | osascript -
