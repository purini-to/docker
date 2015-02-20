# 【ベース設定】 ---------------------------------------------------------------
FROM centos:centos6
MAINTAINER h.urainkyo

# 【インストール】 ---------------------------------------------------------------
# [リポジトリ系]
RUN yum install -y wget unzip tar gcc

# [Java]
RUN yum install -y wget java-1.7.0-openjdk

# [Git]
RUN yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker -y
RUN wget -O - https://git-core.googlecode.com/files/git-1.8.5.2.tar.gz | tar zxvf -
RUN cd git-1.8.5.2 ;\
    ./configure --prefix=/usr/local/ ;\
    make prefix=/usr/local all ;\
    make prefix=/usr/local install

# [Jenkins]
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo ;\
    rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key ;\
    yum -y install jenkins

# 【環境設定】 ---------------------------------------------------------------
# [ローカライズ]
RUN cp /usr/share/zoneinfo/Japan /etc/localtime
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

# [Jenkinsの設定]
# ProcessTreeKillerを無効にする
RUN sed -ri 's/^JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true"/JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true -Dhudson.util.ProcessTree.disable=true"/' /etc/sysconfig/jenkins

# ポート番号 8080 を外部に公開
EXPOSE 8080

# 実行用のシェルスクリプトをコピー
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# 引数なしの実行時にスクリプトを起動
CMD ["/usr/local/bin/run.sh"]
