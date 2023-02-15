FROM debian:10

RUN apt-get update && \
    apt-get install -y curl && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    apt-get remove -y curl && \
    apt-get clean

RUN apt-get install -y wget && \
    wget https://wordpress.org/latest.zip && \
    apt-get remove -y wget

RUN apt-get install -y yum && \
    yum install php-fpm && \
    apt-get remove yum

EXPOSE 9000

ENV WORDPRESS_DB_HOST=$HOST
ENV WORDPRESS_DB_USER=$USER
ENV WORDPRESS_DB_PASSWORD=$PASS
ENV WORDPRESS_DB_NAME=$NAME


#RUN sed  s//0.0.0.0/g /tmp/wp-config.php > /test && mv /test /tmp/wp-config.php


CMD ["echo", "Hello World"]