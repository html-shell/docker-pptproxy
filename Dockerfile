FROM centos:7
MAINTAINER eric <ericzs1208@gmail.com>

RUN yum upgrade
RUN yum -y install vim
RUN yum -y install net-tools
RUN yum -y install epel-release
RUN yum -y install ppp pptp pptp-setup

ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ADD sockd.conf /etc/sockd.conf
EXPOSE 1080
ENTRYPOINT ["/entrypoint.sh"]
