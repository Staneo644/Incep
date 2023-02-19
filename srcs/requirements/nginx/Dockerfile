FROM debian:10

RUN apt-get update && \
    apt-get -y install nginx && \
    apt-get clean

RUN apt-get -y install openssl

RUN openssl req -new -newkey rsa:4096 -x509 -subj="CO=FR"

COPY config/default /etc/nginx/sites-available/default

ARG WORDPRESS_DB_HOST=$HOST
ARG WORDPRESS_DB_USER=$USER
ARG WORDPRESS_DB_PASSWORD=$PASS


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]