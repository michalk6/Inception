# nginx
FROM alpine:3.19

ARG USER_CN=mikurek

RUN apk update && apk add nginx openssl bash

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/${USER_CN}.crt \
        -keyout /etc/nginx/ssl/${USER_CN}.key \
        -subj "/C=PL/ST=Warsaw/L=Warsaw/O=42 School/OU=${USER_CN}/CN=${USER_CN}/"

RUN chmod 600 /etc/nginx/ssl/${USER_CN}.key

RUN rm -f /etc/nginx/http.d/default.conf 2>/dev/null || true

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./conf/default.conf /etc/nginx/http.d/.

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]