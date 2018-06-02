FROM alpine:latest
COPY packer_1.2.3_linux_amd64.zip /tmp/
RUN unzip /tmp/packer_1.2.3_linux_amd64.zip -d /bin
RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories
RUN apk update
RUN apk add docker