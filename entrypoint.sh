#!/bin/sh -l

composer install --prefer-dist

if [ -f ".env.testing" ]
then
	cp .env.testing .env
else
	cp .env.example .env
fi


php artisan key:generate

php vendor/bin/phpunit --coverage-html tests/report
