FROM centos:7

RUN yum -y update
RUN yum install -y epel-release
RUN yum install -y nginx
RUN touch /usr/share/nginx/html/index.html
RUN echo "dzmitrykarneyenka/nginx:11-centos" >> /usr/share/nginx/html/index.html
COPY ./mynginx.conf /etc/nginx/nginx.conf
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]