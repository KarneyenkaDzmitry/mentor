FROM alpine
RUN apk update && apk upgrade
# RUN apk add bash
RUN apk add nginx
RUN mkdir -p /run/nginx
WORKDIR /var/www/html
COPY ./images.13.nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
RUN echo "dzmitrykarneyenka/nginx:12-ubuntu" > index.html
CMD ["nginx", "-g", "daemon off;"]
# CMD ["bash"]

