# syntax=docker/dockerfile:1

FROM ubuntu:22.10

# Install dependencies
RUN apt-get -y update && \
 apt-get -y install nginx && \
 apt-get -y install openjdk-18-jdk && \
 apt-get -y install git && \
 apt-get -y install systemctl && \
 apt-get -y install maven && \
 apt-get -y install nmap

# clone the code from repository
RUN cd /usr/share/nginx/html && \
git clone https://github.com/akshaygupta-dev/springrolls.git

# copy the sever config file
RUN cd /usr/share/nginx/html/springrolls && \
cp server.conf /etc/nginx/sites-available/default

# expose port 80 for http and 443 for https connection
EXPOSE 80 443

# install the required library
RUN cd /usr/share/nginx/html/springrolls && mvn package

# start nginx server
RUN systemctl start nginx

CMD cd /usr/share/nginx/html/springrolls && mvn spring-boot:run
