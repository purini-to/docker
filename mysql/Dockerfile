# 【ベース設定】 ---------------------------------------------------------------
FROM centos:centos6
MAINTAINER h.urainkyo

# 【インストール】 ---------------------------------------------------------------
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN yum install mysql-server --enablerepo=remi -y

# 【環境設定】 ---------------------------------------------------------------
# [ローカライズ]
RUN cp /usr/share/zoneinfo/Japan /etc/localtime
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

# MySQL設定ファイルをコピー
ADD my.cnf /etc/my.cnf
 
# パスワードなしrootログインを許可(これがないとmysqld_safeでエラーになる)
RUN service mysqld start ;\
  sleep 10s ;\
  mysql -e "GRANT ALL ON *.* to 'root'@'%'; FLUSH PRIVILEGES"
 
# ポート番号 3306 を外部に公開
EXPOSE 3306

# 実行用のシェルスクリプトをコピー
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

VOLUME ["/var/lib/mysql"]

# 引数なしの実行時にスクリプトを起動
CMD ["/usr/local/bin/run.sh"]
