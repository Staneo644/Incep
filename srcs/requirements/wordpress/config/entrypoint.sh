#!/bin/bash

sleep 2

wp core download --path=`/var/www/html` --allow-root

wp config create --dbname=${EDATABASE} --dbuser=${EUSER} --dbpass=${EPASS} --dbhost=${EHOST} --path=`/var/www/html` --allow-root

wp user create michel michel@michel.com --user_pass="michel" --allow-root;

wp core install --url=ajossera.42.fr --title=ajossera --admin_user=${EUSER} --admin_password=${EPASS} --admin_email=a@hkds.com --path=`/var/www/html` --allow-root

sed -i "s/database_name_here/${EDATABASE}/g" /var/www/html/wp-config.php
sed -i "s/username_here/${EUSER}/g" /var/www/html/wp-config.php 
sed -i "s/password_here/${EPASS}/g" /var/www/html/wp-config.php
sed -i "s/localhost/${EHOST}/g" /var/www/html/wp-config.php

cp /var/www/html/wp-config.php /var/www/html/wp-config-sample.php


/usr/sbin/php-fpm7.3 --nodaemonize;