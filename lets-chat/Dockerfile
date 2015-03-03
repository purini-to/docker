# 【ベース設定】 ---------------------------------------------------------------
FROM centos:centos6
MAINTAINER h.urainkyo

# 【インストール】 ---------------------------------------------------------------
# [リポジトリ系]
RUN yum install -y wget unzip tar gcc zlib zlib-devel tk-devel tcl-devel sqlite-devel ncurses-devel gdbm-devel readline-devel bzip2-devel db4-devel openssl-devel

# [MongoDB]
# yum?~C??~C~]?~B??~C~H?~C??~B~R追?~J| 
ADD 10gen.repo /etc/yum.repos.d/10gen.repo
RUN yum install -y mongo-10gen mongo-10gen-server

# [Node.js]
RUN rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm && \
    yum install -y nodejs npm --enablerepo=epel

# [Lets-Chat]
RUN yum groupinstall -y "Development tools" && \
    yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel && \
    wget https://www.python.org/ftp/python/2.7.6/Python-2.7.6.tar.xz && \
    tar xf Python-2.7.6.tar.xz && \
    cd Python-2.7.6 && \
    ./configure --prefix=/usr/local --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib" && \
    make && \
    make install

RUN yum install -y git which
RUN git clone https://github.com/sdelements/lets-chat
RUN cd lets-chat && \
    cp settings.yml.sample settings.yml

# 【環境設定】 ---------------------------------------------------------------
# [ローカライズ]
RUN cp /usr/share/zoneinfo/Japan /etc/localtime
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

# [MongoDB]
# 設?~Z?~C~U?~B??~B??~C??~B~R?~E~M置
ADD mongod.conf /etc/mongod.conf

# ポート番号 5000 を外部に公開
EXPOSE 5000

# 実行用のシェルスクリプトをコピー
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# 引数なしの実行時にスクリプトを起動
CMD ["/usr/local/bin/run.sh"]
