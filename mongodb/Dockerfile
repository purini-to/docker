# 【ベース設定】 ---------------------------------------------------------------
FROM centos:centos6
MAINTAINER h.urainkyo

# 【インストール】 ---------------------------------------------------------------
# [リポジトリ系]
RUN yum install -y wget unzip tar gcc

# [MongoDB]
# yumリポジトリを追加
ADD 10gen.repo /etc/yum.repos.d/10gen.repo
RUN yum install -y mongo-10gen mongo-10gen-server

# 【環境設定】 ---------------------------------------------------------------
# [ローカライズ]
RUN cp /usr/share/zoneinfo/Japan /etc/localtime
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

# [MongoDB]
# 設定ファイルを配置
ADD mongod.conf /etc/mongod.conf

# ポート番号 27017 を外部に公開
EXPOSE 27017

# 実行用のシェルスクリプトをコピー
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

VOLUME ["/var/lib/mongo"]

# 引数なしの実行時にスクリプトを起動
CMD ["/usr/local/bin/run.sh"]
