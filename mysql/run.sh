#!/bin/bash

# MySQLのインストールディレクトリ
mysqlDir="/var/lib/mysql"

if [[ ! -d $mysqlDir/mysql ]]; then
	echo "ボリュームが存在しないため、MySQLの初期化を行います"
	mysql_install_db
        service mysqld start
        sleep 5s
        mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO root@\"172.%\" WITH GRANT OPTION; FLUSH PRIVILEGES;"
        mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO admin@\"172.%\" IDENTIFIED BY 'admin' WITH GRANT OPTION; FLUSH PRIVILEGES;"
        mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO admin@\"192.%\" IDENTIFIED BY 'admin' WITH GRANT OPTION; FLUSH PRIVILEGES;"
else
        echo "マウントされたMySQLを使用します"
        service mysqld start
fi
tail -F /dev/null
