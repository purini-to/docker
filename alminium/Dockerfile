# 【ベース設定】 ---------------------------------------------------------------
FROM centos:centos6
MAINTAINER h.urainkyo

# 【インストール】 ---------------------------------------------------------------
# [リポジトリ系]
RUN yum install -y wget unzip tar gcc git

# [ALMinium]
RUN git clone https://github.com/alminium/alminium.git

# 【環境設定】 ---------------------------------------------------------------
# [ローカライズ]
RUN cp /usr/share/zoneinfo/Japan /etc/localtime
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

# [ALMiniumの設定]
ADD config/database.yml /alminium/config/database.yml
ADD config/createdb.sql /alminium/config/createdb.sql
ADD config/init.mysql /alminium/config/init.mysql
ADD config/redmine-plugins.lst /alminium/config/redmine-plugins.lst
RUN cd alminium && \
    env USER=root ENABLE_JENKINS=N SSL=N ALM_HOSTNAME=127.0.0.1 SMTPSET=N USE_DISABLE_SECURITY=y bash ./smelt
RUN mkdir /var/opt/alminium_home && \
    mv /var/opt/alminium /var/opt/alminium_home/repository && \
    ln -s /var/opt/alminium_home/repository /var/opt/alminium && \
    mv /opt/alminium/files /var/opt/alminium_home/uploadFiles && \
    ln -s /var/opt/alminium_home/uploadFiles /opt/alminium/files && \
    mv /var/lib/mysql /var/opt/alminium_home/mysql && \
    ln -s /var/opt/alminium_home/mysql /var/lib/mysql && \
    chown apache:apache -Rf /var/opt/alminium /var/opt/alminium_home /opt/alminium/files && \
    chown apache:apache -Rf /var/opt/alminium_home /opt/alminium/files && \
    chown mysql:mysql -Rf /var/opt/alminium_home/mysql /var/lib/mysql

# 必要なポートを外部に公開
EXPOSE 80 22 443 25 110

# 実行用のシェルスクリプトをコピー
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# 引数なしの実行時にスクリプトを起動
CMD ["/usr/local/bin/run.sh"]
