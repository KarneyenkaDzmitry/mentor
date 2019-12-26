FROM alpine

RUN apk update 
RUN apk upgrade 
RUN apk add curl openjdk8

# RUN apt install -y default-jdk
WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.50/bin/apache-tomcat-8.5.50.tar.gz 
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.50/* /opt/tomcat/.
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
