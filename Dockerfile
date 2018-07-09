FROM debian

RUN apt update \
	&& apt install -y \
	nano \
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

RUN service php7.0-fpm start
RUN service mysql start
RUN service nginx start

EXPOSE 80
EXPOSE 443

COPY ./ /

CMD ["bash", "/entryscript.sh"]
