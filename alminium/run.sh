#!/bin/bash

# MySQL?~A??~B??~C??~B??~C~H?~C??~C??~C~G?~B??~C??~B??~C~H?~C?
mysqlDir="/var/lib/mysql"
# リポジトリのディレクトリ
repoDir="/var/opt/alminium"

if [[ ! -d $mysqlDir/mysql ]]; then
        echo "?~C~\?~C??~C??~C??~C| ?~A~L?~X?~\??~A~W?~A??~A~D?~A~_?~B~A?~@~AMyy
SQL?~A??~H~]?~\~_?~L~V?~B~R?~L?~A~D?~A??~A~Y"
        mysql_install_db
        service mysqld start
        sleep 5s
        mysql < /alminium/config/createdb.sql
        cd /opt/alminium
        bundle exec rake db:migrate RAILS_ENV=production
        bundle exec rake redmine:plugins:migrate RAILS_ENV=production
        mysql alminium < /alm_db_dump.sql
        cd /
else
        echo "?~C~^?~B??~C??~C~H?~A~U?~B~L?~A~_MySQL?~B~R使?~T??~A~W?~A??~A~Y"
        service mysqld start
fi

if [[ ! -d $repoDir/git ]]; then
       mkdir $repoDir/git
       chown -Rf apache:apache $repoDir/git
fi
if [[ ! -d $repoDir/svn ]]; then
       mkdir $repoDir/svn
       chown -Rf apache:apache $repoDir/svn
fi
if [[ ! -d $repoDir/hg ]]; then
       mkdir $repoDir/hg
       chown -Rf apache:apache $repoDir/hg
fi
if [[ ! -d $repoDir/maven ]]; then
       mkdir $repoDir/maven
       chown -Rf apache:apache $repoDir/maven
fi

cd /opt/alminium
bundle exec rake tmp:cache:clear
bundle exec rake tmp:sessions:clear
service httpd start
echo "----- 起動しました ----"
tail -F /dev/null
