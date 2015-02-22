#!/bin/bash

# MySQL?~A??~B??~C??~B??~C~H?~C??~C??~C~G?~B??~C??~B??~C~H?~C?
mysqlDir="/var/lib/mysql"

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
        mysql alminium < /alminium/config/init.mysql
else
        echo "?~C~^?~B??~C??~C~H?~A~U?~B~L?~A~_MySQL?~B~R使?~T??~A~W?~A??~A~Y"
        service mysqld start
fi

cd /opt/alminium
bundle exec rake tmp:cache:clear
bundle exec rake tmp:sessions:clear
service httpd start
echo "----- 起動しました ----"
tail -F /dev/null
