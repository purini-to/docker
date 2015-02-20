# 【ベース設定】 ---------------------------------------------------------------
FROM centos:centos6
MAINTAINER h.urainkyo

# 【環境変数】 ---------------------------------------------------------------
ENV ROOT_PASS root

# 【インストール】 ---------------------------------------------------------------
# [リポジトリ系]
RUN yum update -y
RUN yum install -y wget unzip tar
RUN wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm ;\
    wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm ;\
    wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm ;\
    rpm -ivh epel-release-6-8.noarch.rpm remi-release-6.rpm rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
RUN yum --enablerepo=remi,epel install sudo syslog openssh-server gcc -y

# [Java]
RUN wget --no-check-certificate --no-cookies - --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31-linux-x64.rpm ;\
    rpm -ivh jdk-8u31-linux-x64.rpm ;\
    rm -rf jdk-8u31-linux-x64.rpm

# [Git]
RUN yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker -y
RUN wget https://git-core.googlecode.com/files/git-1.8.5.2.tar.gz
RUN tar zxvf git-1.8.5.2.tar.gz ;\
    cd git-1.8.5.2 ;\
    ./configure --prefix=/usr/local/ ;\
    make prefix=/usr/local all ;\
    make prefix=/usr/local install

# 【環境設定】 ---------------------------------------------------------------
# [ローカライズ]
RUN cp /usr/share/zoneinfo/Japan /etc/localtime
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

# [SSH接続設定]
RUN sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^#UsePrivilegeSeparation yes/UsePrivilegeSeparation no/' /etc/ssh/sshd_config
RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
# 任意のパスワードの場合は以下をコメントアウト & パスワードを書き換える
RUN echo "root:$ROOT_PASS" | chpasswd

# [Play Framework v2.3.6]
ENV PLAY_DL_URL http://downloads.typesafe.com/typesafe-activator/1.2.12/typesafe-activator-1.2.12-minimal.zip
RUN wget $PLAY_DL_URL ;\
    unzip typesafe-activator-1.2.12-minimal.zip ;\
    cd activator-1.2.12-minimal && chmod 775 activator
