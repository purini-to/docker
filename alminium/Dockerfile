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
RUN cd /opt/alminium/plugins && \
    service mysqld start && \
    git clone https://github.com/arkhitech/redmine_issue_templates && \
    sed -ri "s/gem \"simplecov\"/gem \"simplecov\", \"~> 0.6\"/g" redmine_issue_templates/Gemfile && \
    sed -ri "s/gem \"simplecov-rcov\"/gem \"simplecov-rcov\", \">= 0\"/g" redmine_issue_templates/Gemfile && \
    git clone https://github.com/fernandokosh/redmine_time_tracker && \
    sed -ri "s/gem 'timecop'/gem 'timecop', '~> 0.3.5'/g" redmine_time_tracker/Gemfile && \
    cd ../ && \
    bundle install && \
    bundle exec rake redmine:plugins:migrate RAILS_ENV=production
RUN cd /opt/alminium && \
    git clone https://github.com/farend/redmine_theme_farend_fancy public/themes/farend_fancy
RUN service mysqld start && \
    sleep 10s && \
    mysqldump -u alminium -palminium alminium > /alm_db_dump.sql

# 必要なポートを外部に公開
EXPOSE 80

# 実行用のシェルスクリプトをコピー
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# 引数なしの実行時にスクリプトを起動
CMD ["/usr/local/bin/run.sh"]
