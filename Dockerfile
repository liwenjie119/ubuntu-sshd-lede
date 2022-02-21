FROM       ubuntu:22.04
MAINTAINER liwenjie119 "https://github.com/liwenjie119/ubuntu-sshd-lede"

ENV FORCE_UNSAFE_CONFIGURE=1 \
	TZ=Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
     &&apt-get -yqq update&&apt-get -yqq install apt-utils lib32gcc1&&apt-get -yqq install  libterm-readkey-perl wget curl \
     &&sed -ri 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
     &&curl https://raw.githubusercontent.com/liwenjie119/ubuntu-sshd-lede/main/build.sh|bash

EXPOSE 22

WORKDIR /home/user

ENTRYPOINT  ["/usr/sbin/sshd", "-D"]
