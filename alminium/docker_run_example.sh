#!/bin/bash

if [ "$1" == "" ]; then
    PORT=80
else
    PORT=$1
fi

BASE_DIR=/opt/docker-data/alminium
MYSQL_DIR=$BASE_DIR/mysql
UPLOADS_DIR=$BASE_DIR/uploads
REPO_DIR=$BASE_DIR/repository

mkdir -m 777 -p $MYSQL_DIR 2> /dev/null
mkdir -m 777 -p $UPLOADS_DIR 2> /dev/null
mkdir -m 777 -p $REPO_DIR 2> /dev/null

docker run -i -d -p $PORT:80 -v $MYSQL_DIR:/var/lib/mysql -v $UPLOADS_DIR:/opt/alminium/files -v $REPO_DIR:/var/opt/alminium -t urainkyo/alminium
