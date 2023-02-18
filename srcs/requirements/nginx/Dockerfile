FROM debian:10

RUN apt-get update && \
    apt-get -y install nginx && \
    apt-get clean

RUN apt-get -y install openssl

EXPOSE 443

COPY config/default /etc/nginx/sites-available/default

ARG WORDPRESS_DB_HOST=$HOST
ARG WORDPRESS_DB_USER=$USER
ARG WORDPRESS_DB_PASSWORD=$PASS

RUN openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj="CO=FR"

CMD ["nginx", "-g", "daemon off;"]