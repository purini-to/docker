#!/bin/bash

if [ "$1" == "" ]; then
    PORT=8080
else
    PORT=$1
fi

BASE_DIR=/opt/docker-data/hubot
REDIS_DIR=$BASE_DIR/redis

mkdir -m 777 -p $REDIS_DIR 2> /dev/null

docker run -i -d -p $PORT:8080 -v $REDIS_DIR:/var/lib/redis --link devhub:devhub -t urainkyo/hubot devhub
