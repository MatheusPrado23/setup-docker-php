FROM php:8.2-apache

RUN apt-get update

RUN apt-get install -y libpq-dev && \
    apt-get install -y libpng-dev && \
    apt-get install -y zip unzip && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
    docker-php-ext-install pdo pdo_pgsql pgsql && \
    docker-php-ext-install gd && \
    docker-php-ext-install bcmath

RUN apt-get update
RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd && \
    docker-php-ext-install pdo_mysql


RUN curl -sSk https://getcomposer.org/installer | php -- --disable-tls && \
    mv composer.phar /usr/local/bin/composer

RUN a2enmod rewrite

ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-enabled/*.conf
