# 【ベース設定】 ---------------------------------------------------------------
FROM centos:centos6
MAINTAINER h.urainkyo

# 【インストール】 ---------------------------------------------------------------
# [リポジトリ系]
RUN yum install -y wget unzip tar gcc

# [MongoDB]
# yum?~C??~C~]?~B??~C~H?~C??~B~R追?~J| 
ADD 10gen.repo /etc/yum.repos.d/10gen.repo
RUN yum install -y mongo-10gen mongo-10gen-server

# [Node.js]
RUN rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm && \
    yum install -y nodejs npm --enablerepo=epel

# [DevHub]
RUN wget https://github.com/volpe28v/DevHub/archive/master.zip && \
    unzip master.zip && \
    mv DevHub-master DevHub && \
    cd DevHub && \
    npm install && \
    rm -rf lib/bots/* && \
    rm -rf /master.zip

# 【環境設定】 ---------------------------------------------------------------
# [ローカライズ]
RUN cp /usr/share/zoneinfo/Japan /etc/localtime
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

# [MongoDB]
# 設?~Z?~C~U?~B??~B??~C??~B~R?~E~M置
ADD mongod.conf /etc/mongod.conf

# ポート番号 3000 を外部に公開
EXPOSE 3000

# 実行用のシェルスクリプトをコピー
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# 引数なしの実行時にスクリプトを起動
CMD ["/usr/local/bin/run.sh"]
