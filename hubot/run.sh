#!/bin/bash

/etc/init.d/redis start

a="shell"
if [ "$1" != "" ]; then
    if [ "$1" == "devhub" ]; then
        host=`echo $DEVHUB_PORT | sed s/tcp/http/g`
        export HUBOT_DEVHUB_NAME="Hubot"
        export HUBOT_DEVHUB_URL="$host"
        a="devhub"
    fi
fi
echo "$HUBOT_DEVHUB_NAME"
echo "$HUBOT_DEVHUB_URL"

cd /home/hubot/
npm install
./bin/hubot -a $a
