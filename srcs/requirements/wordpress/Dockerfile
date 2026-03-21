# wordpress
FROM alpine:3.22

RUN apk add --no-cache \
    php82 \
    php82-cli \
    php82-fpm \
    php82-mysqli \
    php82-phar \
    php82-mbstring \
    curl

RUN ln -s /usr/bin/php82 /usr/bin/php

COPY ./conf/www.conf /etc/php82/php-fpm.d/.
COPY ./entrypoint.sh /entrypoint.sh

RUN curl -o /usr/local/bin/wp \
    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

RUN chmod +x entrypoint.sh
RUN echo "memory_limit=512M" >> /etc/php82/php.ini

CMD ["./entrypoint.sh"]