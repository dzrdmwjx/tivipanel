FROM php:8.1-apache

# Copy project
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html/panel \
    && chmod 664 /var/www/html/panel/api/.db.db

EXPOSE 80
CMD ["apache2-foreground"]
