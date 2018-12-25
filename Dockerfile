FROM alpine:3.6
MAINTAINER Seonggi Yang <seonggi.yang@gmail.com>

RUN apk add --no-cache \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
    pptpclient dante-server curl

ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ADD sockd.conf /etc/sockd.conf
EXPOSE 1080
ENTRYPOINT ["/entrypoint.sh"]
