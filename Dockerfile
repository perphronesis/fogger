FROM php:7.2.3

# Install PHP extensions deps
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        libpq-dev \
        libzip-dev \
        libpng-dev \
        openssh-server \
        libxrender1 \
        libfontconfig1 \
        libxext6 \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        zlib1g-dev \
        libicu-dev \
        g++ \
        unixodbc-dev \
        libxml2-dev \
        libaio-dev \
        libmemcached-dev \
        freetds-dev \
        libssl-dev \
        openssl \
        nano \
        wget

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-configure pdo_dblib --with-libdir=/lib/x86_64-linux-gnu \
    && pecl install sqlsrv-4.1.6.1 \
    && pecl install pdo_sqlsrv-4.1.6.1 \
    && docker-php-ext-install \
            iconv \
            mbstring \
            bcmath \
            intl \
            gd \
            mysqli \
            pdo_mysql \
            pdo_pgsql \
            pdo_dblib \
            soap \
            sockets \
            zip \
            pcntl \
            ftp \
    && docker-php-ext-enable \
            sqlsrv \
            pdo_sqlsrv

# Composer
RUN wget https://getcomposer.org/composer.phar && mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer


RUN mkdir /fogger && chmod 777 /fogger
COPY . /app
WORKDIR /app

#RUN composer install --no-dev
RUN composer install

ENTRYPOINT ["php", "bin/console"]
CMD ["--help"]
