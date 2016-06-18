#!/bin/bash

rm -rf /var/www/html/app/cache/*
rm -rf /var/www/html/app/logs/*
chown -R www-data:www-data /var/www/html/app/cache
chown -R www-data:www-data /var/www/html/app/logs
chmod -R 777 /var/www/html/app/cache
chmod -R 777 /var/www/html/app/logs

set -e

# Apache gets grumpy about PID files pre-existing
rm -f /var/run/apache2/apache2.pid

exec apache2 -D FOREGROUND
