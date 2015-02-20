#!/bin/bash

# mongodbのインストールディレクトリ
mongodbDir="/var/lib/mongodb"
# オリジナルのmongodbディレクトリ
mongodbOrigin="/var/mongodb_home"

if [ -z "$(ls -A $mongodbDir)" ]
then
        echo "ボリュームが存在しないため、mongodbの初期化を行います"
        mv /var/mongodb_home/* /var/lib/mongodb
        chown mongo:mongo -Rf $mongodbDir
else
        echo "マウントされたmongodbを使用します"
fi

service mongod start
echo "---- 起動しました ----"
tail -F /dev/null
