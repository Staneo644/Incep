FROM debian:10

RUN apt-get update && \
    apt install -y mariadb-server && \
    apt-get clean

EXPOSE 3306

ARG MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ARG MYSQL_DATABASE=${MYSQL_DATABASE}
ARG MYSQL_USER=${MYSQL_USER}
ARG MYSQL_PASSWORD=${MYSQL_PASSWORD}

RUN sed  s/127.0.0.1/0.0.0.0/g /etc/mysql/mariadb.conf.d/50-server.cnf > /test && mv /test /etc/mysql/mariadb.conf.d/50-server.cnf

RUN echo "port=3306" >> /etc/mysql/mariadb.conf.d/50-server.cnf

#COPY my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#RUN sed s/var\/run\/mysqld\/mysqld.sock/\/run\/mysqld\/mysqld.sock/g /etc/mysql/mariadb.conf.d/50-server.cnf > /test && mv /test /etc/mysql/mariadb.conf.d/50-server.cnf
#RUN echo ${MYSQLDATABASE}

RUN service mysql start\
    && mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"\
    && mysql -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"\
    && mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${MYSQL_USER}@'%';"\
    && mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

CMD ["mysqld", "--bind-address=0.0.0.0", "--port=3306"]
#CMD ["mysql", "--bind-address=0.0.0.0", "--port=3306"]