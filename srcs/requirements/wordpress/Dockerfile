FROM debian:10

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y php-fpm && \
    apt-get install -y mariadb-server && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    apt-get remove -y curl && \
    apt-get clean
    
RUN mkdir -p /run/php/

RUN apt-get install -y wget && \
    wget https://wordpress.org/latest.zip

#RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - && \
#    echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list &&\
   

EXPOSE 9000

ARG WORDPRESS_DB_HOST="mariadb"
ARG WORDPRESS_DB_USER=$USER
ARG WORDPRESS_DB_PASSWORD=$PASS
ARG WORDPRESS_DB_NAME=$NAME

RUN sed -i "s/db_name_here/${DB_NAME}/g" /var/www/html/wordpress/wp-config.php && \
    sed -i "s/db_user_here/${DB_USER}/g" /var/www/html/wordpress/wp-config.php && \
    sed -i "s/db_pass_here/${DB_PASS}/g" /var/www/html/wordpress/wp-config.php && \
    sed -i "s/db_host_here/${DB_HOST}/g" /var/www/html/wordpress/wp-config.php

RUN wp core download --allow-root

#RUN sed  s//0.0.0.0/g /tmp/wp-config.php > /test && mv /test /tmp/wp-config.php

#ENTRYPOINT ["echo", "yo"]
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
