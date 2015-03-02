#!/bin/bash

# Jenkinsのインストールディレクトリ
jenkinsDir="/var/lib/jenkins"

if [ -z "$(ls -A $jenkinsDir)" ]
then
        echo "ボリュームが存在しないため、Jenkinsの初期化を行います"
        # プラグインのインストール
        grep -v "^#" /plugin.lst | xargs wget -nv -T 60 -t 3 -P /var/lib/jenkins/plugins
        mv /org.codefirst.SimpleThemeDecorator.xml /var/lib/jenkins/
	chown -R jenkins:jenkins /var/lib/jenkins/plugins
else
        echo "マウントされたJenkinsを使用します"
fi

service jenkins start
tail -F /dev/null
