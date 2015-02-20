#!/bin/bash

if [ "$MONGODB_PORT" != '' ]
then
        mongodbUrl=`echo $MONGODB_PORT | sed -e "s/tcp/mongodb/"`
        echo $mongodbUrl
	export MONGOLAB_URI=$mongodbUrl
fi
cd DevHub
node app.js -p 3000 -d devhub_db -t DevHub
