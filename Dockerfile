FROM ubuntu:18.04
MAINTAINER Yonggang Luo <luoyonggang@gmail.com>

RUN apt-get -y update
RUN apt-get -y install vim net-tools pptp-linux inetutils-ping curl iproute2 dante-server

ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ADD sockd.conf /etc/sockd.conf
EXPOSE 1080
ENTRYPOINT ["/entrypoint.sh"]
