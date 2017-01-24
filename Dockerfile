FROM dankempster/php:7.1-alpine

MAINTAINER Dan Kempster <dev@dankempster.co.uk>

RUN apk add --update git zip unzip

# Set PHP config
COPY *.ini /usr/local/etc/php/conf.d/

# Setup Composer
COPY init-composer.sh /usr/local/bin/
COPY docker-entry.sh /

RUN chmod +x /usr/local/bin/init-composer.sh; \
    chmod +x /docker-entry.sh; \
    \
    mkdir -p /composer-cache; \
    mkdir -p /composer/bin; \
    mkdir -p /composer/home; \
    \
    chown -R www-data:www-data /composer*; \
    chmod -R 2775 /composer*;

ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_CACHE_DIR=/composer-cache \
    COMPOSER_HOME=/composer/home

ENV PATH $PATH:/composer/bin:/composer/home/vendor/bin

VOLUME /composer /composer-cache

ENTRYPOINT [ "/docker-entry.sh" ]

