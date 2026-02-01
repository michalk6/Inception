# wordpress
FROM alpine:3.19

RUN apk update && apk add php-fpm

COPY ./conf/www.conf /etc/php82/php-fpm.d/.

CMD ["php-fpm82", "-F"]