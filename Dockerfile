FROM debian:stretch
MAINTAINER Wilply

ARG DEBIAN_FRONTEND="noninteractive"

RUN apt update && apt install -y \
		nginx-full \
		mariadb-server \
		php7.0 \
    php7.0-fpm \
    php7.0-mysql \
    php7.0-curl \
    php7.0-json \
    php7.0-gd \
    php7.0-mcrypt \
    php7.0-msgpack \
    php7.0-memcached \
    php7.0-intl \
    php7.0-sqlite3 \
    php7.0-gmp \
    php7.0-geoip \
    php7.0-mbstring \
    php7.0-xml \
    php7.0-zip

WORKDIR /app
RUN mkdir site

EXPOSE 80

RUN rm -rf /tmp/* \
	/var/lib/apt/lists/*

COPY ./app/ /app/
RUN chmod 770 /app/start.sh
COPY ./default /etc/nginx/sites-available/default

VOLUME /app/site

CMD ["/app/start.sh"]
