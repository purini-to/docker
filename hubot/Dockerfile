# 【ベース設定】 ---------------------------------------------------------------
FROM centos:centos6
MAINTAINER h.urainkyo

# 【インストール】 ---------------------------------------------------------------
# [リポジトリ系]
RUN yum install -y wget unzip tar gcc

# [Node.js]
RUN rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm && \
    yum install -y nodejs npm redis --enablerepo=epel

# 【環境設定】 ---------------------------------------------------------------
# [ローカライズ]
RUN cp /usr/share/zoneinfo/Japan /etc/localtime
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

# [Hubotのインストール]
RUN npm install -g coffee-script yo generator-hubot

# hubot user
RUN useradd -m -s /bin/bash hubot && \
    echo 'hubot:hubot' | chpasswd
ENV HOME /home/hubot
WORKDIR $HOME
USER hubot
RUN yo hubot --owner="User <user@example.com>" --name="Hubot" --description="Nameless" --adapter=devhub
RUN npm install -S hubot-schedule && \
    sed -ri "2i \"hubot-schedule\"," external-scripts.json

USER root
WORKDIR /
# ポート番号 8080 を外部に公開
EXPOSE 8080

# 実行用のシェルスクリプトをコピー
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# 引数なしの実行時にスクリプトを起動
ENTRYPOINT ["/usr/local/bin/run.sh"]
