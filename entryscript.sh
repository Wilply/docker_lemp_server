#!/bin/bash

service mysql start
service php7.0-fpm start
service nginx start


tail -f /var/log/nginx/error.log
