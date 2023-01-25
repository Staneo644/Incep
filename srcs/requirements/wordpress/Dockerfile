FROM debian:10

RUN apt-get update && \
    apt install -y mariadb-server && \
    apt-get clean

EXPOSE 9000

ARG WORDPRESS_DB_HOST=$HOST
ARG WORDPRESS_DB_USER=$USER
ARG WORDPRESS_DB_PASSWORD=$PASS

CMD ["echo", "Hello World"]