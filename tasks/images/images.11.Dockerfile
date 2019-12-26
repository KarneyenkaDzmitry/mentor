FROM centos:7
RUN yum -y update
RUN yum install -y epel-release
RUN yum install -y nginx
RUN touch /usr/share/nginx/html/iindex.html
RUN echo "dzmitrykarneyenka/nginx:11-centos" >> /usr/share/nginx/html/iindex.html
COPY ./mynginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
# RUN cat /etc/nginx/nginx.conf
# COPY  nginx.conf /etc/nginx/default.d/my.conf
# /etc/nginx/nginx.conf
# RUN ls /usr
# RUN echo "location / {root /usr/share/nginx/html//; index my-index.html;}" >> /etc/nginx/conf.d
# RUN cat /usr/share/nginx/html/my-index.html
# FROM centos
# RUN rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
# RUN yum -y install nginx 
# # $$ yum install firewalld
# # RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
# #     rm -f /lib/systemd/system/multi-user.target.wants/*; \
# #     rm -f /etc/systemd/system/*.wants/*; \
# #     rm -f /lib/systemd/system/local-fs.target.wants/*; \
# #     rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
# #     rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
# #     rm -f /lib/systemd/system/basic.target.wants/*; \
# #     rm -f /lib/systemd/system/anaconda.target.wants/*;
# # VOLUME [ "/sys/fs/cgroup" ]
# # RUN ["/usr/sbin/init"]
# # RUN systemctl start firewalld
# # RUN systemctl enable firewalld
# # RUN systemctl status firewalld
# RUN echo "dzmitrykarneyenka/nginx:11-centos" > /usr/share/nginx/html/index.html
# # RUN firewall-cmd --permanent --zone=public --add-service=http
# # RUN firewall-cmd --reload

# CMD ["systemctl","start","nginx"]

# ENV container docker

# RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
#     rm -f /lib/systemd/system/multi-user.target.wants/*; \
#     rm -f /etc/systemd/system/*.wants/*; \
#     rm -f /lib/systemd/system/local-fs.target.wants/*; \
#     rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
#     rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
#     rm -f /lib/systemd/system/basic.target.wants/*; \
#     rm -f /lib/systemd/system/anaconda.target.wants/*;
# VOLUME [ "/sys/fs/cgroup" ]
# CMD ["/usr/sbin/init"]

# FROM builder


# RUN rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

#  yum clean all; systemctl enable nginx.service
# CMD ["/usr/sbin/init"]
# CMD ["systemctl","start","nginx"]
# CMD ["bash"]
