FROM sumarokov/docker-php-fpm:latest

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require consolidation/cgr
RUN ln -s $HOME/.composer/vendor/bin/cgr /usr/local/bin/cgr
RUN cgr drush/drush:8.x-dev
RUN ln -s $HOME/.composer/vendor/bin/drush /usr/local/bin/drush