FROM php:8.1-apache

RUN apt update \
&& apt install --yes ca-certificates jq wget zlib1g-dev libpng-dev libicu-dev libldap2-dev libbz2-dev libzip-dev cron

RUN docker-php-ext-install mysqli gd intl exif ldap bz2 zip opcache \
&& docker-php-ext-enable mysqli gd intl exif ldap bz2 zip opcache

ENV PHP_ALLOW_URL_INCLUDE=On
ENV PHP_SESSION_COOKIE_SECURE=true
ENV PHP_SESSION_COOKIE_PATH=/
ENV PHP_SESSION_COOKIE_HTTPONLY=true

COPY glpi-start.sh /opt
ENTRYPOINT [ "/opt/glpi-start.sh" ]