FROM debian:10

RUN apt-get update && \
    apt-get -y install nginx && \
    apt-get clean

RUN apt-get -y install openssl

RUN mkdir -p /etc/ssl/key/private/ && mkdir -p /etc/ssl/cert/

RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/key/private/private.key -out /etc/ssl/cert/certificate.crt -nodes -subj="/C=FR"

COPY config/default /etc/nginx/sites-available/default

RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

WORKDIR /var/www/html

EXPOSE 443

ENTRYPOINT [ "nginx" ]

CMD ["-g", "daemon off;"]