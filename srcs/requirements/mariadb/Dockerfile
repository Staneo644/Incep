FROM debian:10

RUN apt-get update && \
    apt install -y mariadb-server && \
    apt-get clean

EXPOSE 3306

ARG MYSQL_ROOT_PASSWORD=$ROOTPASS
ARG MYSQL_DATABASE=$DATABASE
ARG MYSQL_USER=$USER
ARG MYSQL_PASSWORD=$PASS

CMD ["echo", "Hello World"]