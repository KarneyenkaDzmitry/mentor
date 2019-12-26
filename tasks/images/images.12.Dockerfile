FROM ubuntu
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y nginx
EXPOSE 80
RUN echo "dzmitrykarneyenka/nginx:12-ubuntu" > /var/www/html/index.nginx-debian.html
CMD ["nginx", "-g", "daemon off;"]
# Build Custom Docker Images. Push it into your registry on Docker Hub.

# Requirements:
# image name:tag : DzmitryKarneyenka/nginx:12-ubuntu


# base image: ubuntu;

# nginx web server should be installed;
# RUN dpkg -l | grep systemd
# RUN apt-get install -y systemd
# RUN ufw app list
# RUN ufw allow 'Nginx HTTP'
# RUN ufw status
# RUN dpkg -l | grep systemd
# RUN dpkg -L systemd
# RUN systemctl status nginx
# container should expose 80 port;

# nginx web server should return image name e.g.DzmitryKarneyenka/nginx:12-ubuntu as the only content on home page.
# /var/www/html/index.nginx-debian.html
# RUN echo "dzmitrykarneyenka/nginx:12-ubuntu" > /usr/share/nginx/html/index.html
# RUN cat /usr/share/nginx/html/index.html
# RUN cat /var/www/html/index.nginx-debian.html
# /var/www/html/index.nginx-debian.html

# CMD ["/etc/init.d/nginx", "start"]
# CMD ["systemctl","start","nginx"]
# CMD ["service","nginx","start"]
# CMD ["bash"]
# For checking run the following command:
# docker run -d -p 10091:80 --name nginx-ubuntu-12 DzmitryKarneyenka/nginx:12-ubuntu

# Check the service on localhost:10091, you should see correct message.

# If container works fine, pull your image in docker hub.
# After pullling check images has appeared in your Docker Hub repository.
