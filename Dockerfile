#
# Java minimal runtime Dockerfile
#
FROM eistec/docker-alpine:latest

MAINTAINER Joakim Nohlgård <joakim.nohlgard@eistec.se>

# Install OpenJDK Java run time and shadow for useradd
RUN apk --update add openjdk8-jre-base shadow curl

RUN mkdir -p /opt/leshan-server-demo && \
    curl -o /opt/leshan-server-demo/leshan-server-demo.jar \
        https://hudson.eclipse.org/leshan/job/leshan/lastSuccessfulBuild/artifact/leshan-server-demo.jar && \
    mkdir -p /opt/leshan-bsserver-demo && \
    curl -o /opt/leshan-bsserver-demo/leshan-bsserver-demo.jar \
        https://hudson.eclipse.org/leshan/job/leshan/lastSuccessfulBuild/artifact/leshan-bsserver-demo.jar
RUN useradd -r -d /opt/leshan-server-demo -s /sbin/nologin -U leshan

RUN touch /opt/leshan-server-demo/Californium.properties && \
    chown leshan:leshan /opt/leshan-server-demo/Californium.properties && \
    touch /opt/leshan-bsserver-demo/Californium.properties && \
    chown leshan:leshan /opt/leshan-bsserver-demo/Californium.properties

# Install runit service files
RUN mkdir -p /etc/service/leshan-server-demo
COPY runit/leshan-server-demo.sh /etc/service/leshan-server-demo/run
RUN mkdir -p /etc/service/leshan-bsserver-demo
COPY runit/leshan-bsserver-demo.sh /etc/service/leshan-bsserver-demo/run
