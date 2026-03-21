# mariadb
FROM alpine:3.22

RUN apk add --no-cache mariadb mariadb-client

RUN mkdir -p /run/mysqld /etc/mysql \
    && chown -R mysql:mysql /run/mysqld

COPY conf/mariadb-server.cnf /etc/my.cnf.d/
COPY init.sql /etc/mysql/init.sql
COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

CMD ["./entrypoint.sh"]