FROM php:8.1-apache

# Install SQLite3
RUN apt-get update && apt-get install -y libsqlite3-dev \
    && docker-php-ext-install sqlite3 \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache rewrite (optional)
RUN a2enmod rewrite

# Copy project
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html/api \
    && chmod 664 /var/www/html/panel/api/.db.db

EXPOSE 80
CMD ["apache2-foreground"]
