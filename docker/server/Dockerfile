FROM php:7.4-apache

WORKDIR "/var/www/html"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libpq-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd gettext pgsql pdo_pgsql

#RUN pecl install xdebug \
#    && docker-php-ext-enable xdebug

RUN a2enmod rewrite
