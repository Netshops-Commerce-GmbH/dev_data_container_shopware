FROM ubuntu:latest

ENV TERM=linux

VOLUME ["/var/www/src", "/var/www/html"]

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        unzip \
        wget \
        zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*;

ADD entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

WORKDIR /var/www/html

CMD ["/root/entrypoint.sh"]