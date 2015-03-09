#!/bin/bash

if [ "$1" == "" ]; then
    PORT=3000
else
    PORT=$1
fi

BASE_DIR=/opt/docker-data/devhub
MONGO_DIR=$BASE_DIR/mongodb
UPLOADS_DIR=$BASE_DIR/uploads

mkdir -m 777 -p $MONGO_DIR 2> /dev/null
mkdir -m 777 -p $UPLOADS_DIR 2> /dev/null

docker run -i -d -p $PORT:3000 -v $MONGO_DIR:/var/lib/mongo -v $UPLOADS_DIR:/DevHub/static/uploads --name devhub  -t urainkyo/devhub
