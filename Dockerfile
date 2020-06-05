FROM sumarokov/docker-php-fpm:1.2

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require drush/drush:8
RUN ln -s $HOME/.composer/vendor/bin/drush /usr/local/bin/drush