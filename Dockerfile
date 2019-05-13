FROM drush/drush:8

RUN apk update && apk add \
    libmemcached-dev \
    zip \
    libzip-dev \
    libpng-dev \
    libxml2-dev

# Add the Memcache PHP module.
RUN curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/master.tar.gz" \
	&& mkdir -p /usr/src/php/ext/memcached \
	&& tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
	&& docker-php-ext-configure memcached \
	&& docker-php-ext-install memcached \
	&& rm /tmp/memcached.tar.gz


RUN docker-php-ext-configure gd && \
    docker-php-ext-install gd xmlrpc