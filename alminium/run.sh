#!/bin/bash

cd alminium
service mysqld start
bundle exec rake tmp:cache:clear
bundle exec rake tmp:sessions:clear
service httpd start
echo "----- 起動しました ----"
tail -F /dev/null
