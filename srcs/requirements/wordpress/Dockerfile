FROM debian:10


WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y php-fpm && \
    apt-get install -y php7.3 && \
    apt-get install -y php-mysql && \
    apt-get install -y mariadb-server && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    apt-get remove -y curl && \
    apt-get clean

RUN mkdir -p /run/php/

#RUN apt-get install -y wget && \
 #   wget https://wordpress.org/latest.zip

#RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - && \
 #   echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list &&\


EXPOSE 9000

ARG HOST
ARG USER
ARG PASS
ARG DATABASE

#RUN sed -i "s/db_name_here/${DATABASE}}/g" /var/www/html/wordpress/wp-config.php && \
 #   sed -i "s/db_user_here/${USER}/g" /var/www/html/wordpress/wp-config.php && \
  #  sed -i "s/db_pass_here/${PASS}/g" /var/www/html/wordpress/wp-config.php && \
   # sed -i "s/db_host_here/${HOST}/g" /var/www/html/wordpress/wp-config.php

#RUN sed  s//0.0.0.0/g /tmp/wp-config.php > /test && mv /test /tmp/wp-config.php
#ENTRYPOINT ["echo", "yo"]

COPY /config/wp /etc/php/7.3/fpm/pool.d/www.conf

COPY /config/entrypoint /

RUN chmod +x /entrypoint

ENTRYPOINT ["/entrypoint"]
