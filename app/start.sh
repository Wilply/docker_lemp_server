#!/bin/bash

if [ ! -s /firststart ]; then
  echo [INFO] INIT MYSQL
  touch /firststart
  service mysql start
  mysql < /app/initdb.sql
  if [ -s /app/site/init_db.sql ]; then
    echo [INFO] Running init_db.sql
    mysql -u root -pP@ssw0rd < /app/site/init_db.sql
  fi
else
  service mysql start
fi

echo [INFO] Starting services
service php7.0-fpm start
service nginx start


tail -f /var/log/nginx/error.log
