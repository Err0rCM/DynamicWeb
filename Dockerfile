FROM php:5.6-apache
LABEL author="Err0r"

COPY ./src /var/www/html
RUN docker-php-ext-install mysql mysqli && \
    chmod 777 /var/www/html/img