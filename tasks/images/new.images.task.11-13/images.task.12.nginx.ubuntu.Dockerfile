FROM ubuntu
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y nginx
RUN echo "dzmitrykarneyenka/nginx:12-ubuntu" > /var/www/html/index.nginx-debian.html
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]