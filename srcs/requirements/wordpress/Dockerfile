# wordpress
FROM alpine:3.19

RUN apk add --no-cache \
    php82 \
    php82-cli \
    php82-fpm \
    php82-mysqli \
    php82-phar \
    php82-mbstring \
    curl

COPY ./conf/www.conf /etc/php82/php-fpm.d/.
COPY ./entrypoint.sh .
RUN chmod +x entrypoint.sh
RUN echo "memory_limit=512M" >> /etc/php82/php.ini

CMD ["./entrypoint.sh"]