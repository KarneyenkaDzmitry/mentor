FROM centos:7
LABEL AUTHOR="dkarneyenka"
RUN yum install -y httpd web-assets-httpd && \
    yum clean all && \
    echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf && \ 
    echo "Student: Dzmitry Karneyenka" > /var/www/html/index.html
EXPOSE 80
ENTRYPOINT ["httpd"]
CMD ["-DFOREGROUND"]