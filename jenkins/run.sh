#!/bin/bash

# Jenkinsのインストールディレクトリ
jenkinsDir="/var/lib/jenkins"

if [ -z "$(ls -A $jenkinsDir)" ]
then
        echo "ボリュームが存在しないため、Jenkinsの初期化を行います"
        # プラグインのインストール
	wget -nv -T 60 -t 3 -P /var/lib/jenkins/plugins https://updates.jenkins-ci.org/latest/scm-api.hpi
	wget -nv -T 60 -t 3 -P /var/lib/jenkins/plugins https://updates.jenkins-ci.org/latest/git-client.hpi
	wget -nv -T 60 -t 3 -P /var/lib/jenkins/plugins https://updates.jenkins-ci.org/latest/git.hpi
	wget -nv -T 60 -t 3 -P /var/lib/jenkins/plugins https://updates.jenkins-ci.org/latest/ansicolor.hpi
	wget -nv -T 60 -t 3 -P /var/lib/jenkins/plugins https://updates.jenkins-ci.org/latest/postbuild-task.hpi
	chown -R jenkins:jenkins /var/lib/jenkins/plugins
else
        echo "マウントされたJenkinsを使用します"
fi

service jenkins start
tail -F /dev/null
