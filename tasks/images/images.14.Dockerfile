FROM centos:7

WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.50/bin/apache-tomcat-8.5.50.tar.gz 
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.50/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
# Build Custom Docker Images. Push it into your registry on Docker Hub.

# Requirements:
# new image name: DzmitryKarneyenka/tomcat:14-centos
# base image: centos:7;
# Install prepare infrastructure
# RUN yum -y update && \
#     yum -y install wget && \
#     yum -y install tar
# Centos based container with Java and Tomcat

# Prepare environment 
# ENV JAVA_HOME /opt/java
# ENV CATALINA_HOME /opt/tomcat 
# ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

# # Install Oracle Java8
# ENV JAVA_VERSION 8u191
# ENV JAVA_BUILD 8u191-b12
# ENV JAVA_DL_HASH 2787e4a523244c269598db4e85c51e0c

# RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
#     http://download.oracle.com/otn-pub/java/jdk/${JAVA_BUILD}/${JAVA_DL_HASH}/jdk-${JAVA_VERSION}-linux-x64.tar.gz && \
#     tar -xvf jdk-${JAVA_VERSION}-linux-x64.tar.gz && \
#     rm jdk*.tar.gz && \
#     mv jdk* ${JAVA_HOME}


# # Install Tomcat
# ENV TOMCAT_MAJOR 8
# ENV TOMCAT_VERSION 8.5.35

# RUN wget http://mirror.linux-ia64.org/apache/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
#     tar -xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
#     rm apache-tomcat*.tar.gz && \
#     mv apache-tomcat* ${CATALINA_HOME}

# RUN chmod +x ${CATALINA_HOME}/bin/*sh

# # Create Tomcat admin user
# ADD create_admin_user.sh $CATALINA_HOME/scripts/create_admin_user.sh
# ADD tomcat.sh $CATALINA_HOME/scripts/tomcat.sh
# RUN chmod +x $CATALINA_HOME/scripts/*.sh

# # Create tomcat user
# RUN groupadd -r tomcat && \
#     useradd -g tomcat -d ${CATALINA_HOME} -s /sbin/nologin  -c "Tomcat user" tomcat && \
#     chown -R tomcat:tomcat ${CATALINA_HOME}

# WORKDIR /opt/tomcat

# EXPOSE 8080
# EXPOSE 8009

# USER tomcat
# CMD ["tomcat.sh"]
# tomcat app server should be installed and started.
# For checking run the following command:
# docker run -d -p 10093:8080 --name tomcat-centos-14 DzmitryKarneyenka/tomcat:14-centos
# Open in your browser localhost:10093, you should see tomcat default page.

# If container works fine, pull your image in docker hub.
# After pullling check images has appeared in your Docker Hub repository.

# Documentation:
# https://docs.docker.com/engine/reference/builder/
# https://docs.docker.com/engine/reference/commandline/build/
# https://docs.docker.com/engine/reference/commandline/image/
# https://docs.docker.com/engine/reference/commandline/images/
