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
RUN apt-get install -y varnish && \
    sed -i.original -e 's/port = "8080"/port = "80"/' /etc/varnish/default.vcl && \
    curl -L https://github.com/drush-ops/drush/releases/download/8.1.3/drush.phar > /usr/bin/drush && \
    chmod +x /usr/bin/drush
CMD varnishd -f /etc/varnish/default.vcl -s malloc,100M && apache2-foreground
