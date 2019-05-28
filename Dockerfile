FROM drush/drush:8

RUN apk update && apk add \
    libmemcached-dev \
    zip \
    libzip-dev \
    libpng-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libxml2-dev

# Add the Memcache PHP module.
RUN curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/master.tar.gz" \
	&& mkdir -p /usr/src/php/ext/memcached \
	&& tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
	&& docker-php-ext-configure memcached \
	&& docker-php-ext-install memcached \
	&& rm -f /tmp/memcached.tar.gz


RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ && \
	docker-php-ext-configure bcmath && \
	docker-php-ext-configure zip --with-libzip && \
	docker-php-ext-install gd \
						   pdo_mysql \
						   mbstring \
						   zip \
						   bcmath \
						   soap \
						   sockets \
						   mysqli \
						   xmlrpc