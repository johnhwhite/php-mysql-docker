FROM php:7-apache
RUN a2dismod -f autoindex && \
    a2enmod rewrite && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y libcurl4-gnutls-dev libpng12-dev libxml2-dev && \
    docker-php-ext-configure curl && docker-php-ext-install curl && \
    docker-php-ext-configure gd && docker-php-ext-install gd && \
    docker-php-ext-configure mbstring && docker-php-ext-install mbstring && \
    docker-php-ext-configure mysqli && docker-php-ext-install mysqli && \
    docker-php-ext-configure opcache && docker-php-ext-install opcache && \
    docker-php-ext-configure pdo_mysql && docker-php-ext-install pdo_mysql && \
    docker-php-ext-configure simplexml && docker-php-ext-install simplexml && \
    docker-php-ext-configure xml && docker-php-ext-install xml
