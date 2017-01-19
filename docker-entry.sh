#!/bin/sh

if [ ! -f /composer/bin/composer.phar ]; then
    /usr/local/bin/init-composer.sh
fi;

if [ ! -f /composer/bin/composer.phar ]; then
    echo "ERR: composer set up failed!"
    exit 1
fi;
