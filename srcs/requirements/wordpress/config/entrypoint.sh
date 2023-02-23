#!/bin/bash

#sleep 2

wp core download --allow-root

wp config create --dbname=${DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASS} --dbhost=${SQL_HOST} --allow-root

wp core install --url=${DOMAIN} --title=${SITE} --admin_user=${ROOT_NAME} --admin_password=${ROOT_PASS} --admin_email=${ROOT_MAIL} --allow-root

wp user create ${USER_NAME} ${USER_MAIL} --user_pass=${USER_PASS} --allow-root;

/usr/sbin/php-fpm7.3 --nodaemonize;