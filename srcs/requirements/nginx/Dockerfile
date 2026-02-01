# nginx
FROM alpine:3.19

RUN apk update && apk add nginx

COPY ./conf/default.conf /etc/nginx/http.d/.

CMD ["nginx", "-g", "daemon off;"]