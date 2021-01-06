FROM       ubuntu:18.04
MAINTAINER liwenjie119 "https://github.com/liwenjie119/ubuntu-sshd-lede"

RUN curl https://raw.githubusercontent.com/liwenjie119/ubuntu-sshd-lede/main/build.sh|bash

EXPOSE 22

WORKDIR /home/123

ENTRYPOINT  ["/usr/sbin/sshd", "-D"]
