#!/bin/sh
cd /var/www/html

if [ ! -f wp-config.php ]; then

wp core download --allow-root
wp config create \
    --dbname=$WORDPRESS_DB_NAME \
    --dbuser=$WORDPRESS_DB_USER \
    --dbpass=$WORDPRESS_DB_PASSWORD \
    --dbhost=$WORDPRESS_DB_HOST \
    --allow-root
wp core install \
    --url=$WORDPRESS_URL \
    --title=$WORDPRESS_TITLE \
    --admin_user=$WORDPRESS_ADMIN \
    --admin_password=$WORDPRESS_ADMIN_PASSWORD \
    --admin_email=$WORDPRESS_ADMIN_EMAIL \
    --allow-root
fi

php-fpm82 -F