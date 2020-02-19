FROM phpdockerio/php73-fpm:latest
WORKDIR "/application"

# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install php7.3-mysql php-imagick php7.3-intl php7.3-soap

# Install Xdebug
RUN pecl install xdebug

# Remove apt repositories and tmp
RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install composer
RUN mkdir /tmp/composer/ && \
    cd /tmp/composer && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod a+x /usr/local/bin/composer && \
    cd / && \
    rm -rf /tmp/composer
