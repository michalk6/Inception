#!/bin/sh

if [ ! -d /var/lib/mysql/mysql ]; then
    mariadb-install-db --user=mysql

    mariadbd --user=mysql --skip-networking &
    pid="$!"

    until mariadb -u root --protocol=socket -e "SELECT 1" >/dev/null 2>&1; do
        sleep 1
    done

    mariadb -u root --protocol=socket <<EOF
        CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};
        CREATE USER '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';
        GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${WORDPRESS_DB_USER}'@'%';
        FLUSH PRIVILEGES;
EOF

    kill "$pid"
    wait "$pid"
fi

exec mariadbd --user=mysql