#!/bin/sh

if [ ! -d /var/lib/mysql/mysql ]; then
    mysql_install_db --user=mysql
fi

exec mysqld