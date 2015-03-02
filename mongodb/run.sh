#!/bin/bash

# mongodbのインストールディレクトリ
# mongodbDir="/var/lib/mongo"
# オリジナルのmongodbディレクトリ
# mongodbOrigin="/var/mongo_home"

# if [ ! -d $mongodbDir/journal ]
# then
#        echo "ボリュームが存在しないため、mongodbの初期化を行います"
#         mv $mongodbOrigin/* $mongodbDir
#        chown mongod:mongod -Rf $mongodbDir
# else
#         echo "マウントされたmongodbを使用します"
# fi

service mongod start
echo "---- 起動しました ----"
tail -F /dev/null
