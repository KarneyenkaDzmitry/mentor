FROM alpine
RUN apk update && apk upgrade
RUN apk add nginx
RUN mkdir -p /run/nginx
WORKDIR /var/www/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
RUN echo "dzmitrykarneyenka/nginx:13-alpine" > index.html
ENTRYPOINT ["nginx", "-g", "daemon off;"]

