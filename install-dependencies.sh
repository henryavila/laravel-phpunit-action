#!/bin/sh

apk add --no-cache mysql-client postgresql-client php7-bcmath

docker-php-ext-configure bcmath
docker-php-ext-install bcmath
docker-php-ext-install pcntl
