FROM centos:7

LABEL AUTHOR=dkarneyenka

RUN     yum upgrade -y &&\
    yum install -y httpd web-assets-httpd &&\
    yum clean all &&\
    echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf

VOLUME /task/3/index.html:/etc/httpd
COPY ./index.html /var/www/html/index.html

EXPOSE 80

ENTRYPOINT ["httpd"]

CMD ["-DFOREGROUND"]