# syntax=docker/dockerfile:1

FROM ubuntu:22.10

# Install dependencies
RUN apt-get -y update && \
 apt-get -y install git && \
 apt-get -y install openjdk-18-jdk && \
 apt-get -y install maven && \

# clone the code from repository
RUN mkdir -p /usr/share && git clone https://github.com/akshaygupta-dev/springrolls.git

# install the required library
RUN cd /usr/share/springrolls && mvn package

CMD cd /usr/share/nginx/html/springrolls && mvn spring-boot:run
