#!/bin/bash

if [ "$TITLE" -eq "" ]; then
    TITLE="DevHub"
fi

service mongod start
cd DevHub
node app.js -p 3000 -d devhub_db -t $TITLE
