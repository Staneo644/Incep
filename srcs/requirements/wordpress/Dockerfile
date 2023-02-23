FROM debian:10

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y php-fpm && \
    #apt-get install -y php7.3 && \
    apt-get install -y php-mysql && \
    apt-get install -y mariadb-client && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    apt-get remove -y curl && \
    apt-get clean

ARG VOLUME

RUN mkdir -p /run/php ${VOLUME}

#RUN apt-get install -y wget && \
 #   wget https://wordpress.org/latest.zip

#RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - && \
 #   echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list &&\



EXPOSE 9000

#RUN sed  s//0.0.0.0/g /tmp/wp-config.php > /test && mv /test /tmp/wp-config.php

COPY /config/wp /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR ${VOLUME}

COPY /config/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
