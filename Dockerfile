FROM alpine:3.9

ENV TERM=linux

VOLUME ["/var/www/src", "/var/www/html"]

RUN apk add --no-cache \
    unzip \
    zip \
    wget

ADD entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

WORKDIR /var/www/html

CMD ["/root/entrypoint.sh"]
