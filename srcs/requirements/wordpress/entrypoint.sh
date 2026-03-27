#!/bin/sh
cd /var/www/html

if [ ! -f wp-config.php ]; then

    until nc -z mariadb $WORDPRESS_DB_PORT; do
        sleep 1
    done

    wp core download --allow-root
    wp config create \
        --dbname=$WORDPRESS_DB_NAME \
        --dbuser=$WORDPRESS_DB_USER \
        --dbpass=$WORDPRESS_DB_PASSWORD \
        --dbhost=$WORDPRESS_DB_HOST:$WORDPRESS_DB_PORT \
        --allow-root
        
    wp core install \
        --url=$WORDPRESS_URL \
        --title=$WORDPRESS_TITLE \
        --admin_user=$WORDPRESS_ADMIN \
        --admin_password=$WORDPRESS_ADMIN_PASSWORD \
        --admin_email=$WORDPRESS_ADMIN_EMAIL \
        --allow-root

    if ! wp user get $WORDPRESS_USER --allow-root > /dev/null 2>&1; then
		wp user create \
			$WORDPRESS_USER \
			$WORDPRESS_USER_EMAIL \
			--user_pass=$WORDPRESS_USER_PASSWORD \
			--role=author \
			--allow-root
	fi
fi

php-fpm82 -F