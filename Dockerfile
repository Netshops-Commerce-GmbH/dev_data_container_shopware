FROM alpine:3.9

ENV TERM=linux

VOLUME ["/var/www/src", "/var/www/html"]

RUN apk add --no-cache \
    unzip \
    zip \
    wget \
    bash

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www/html

CMD ["/entrypoint.sh"]
