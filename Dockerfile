# Dockerfile para Laravel 5.4
FROM php:7.4-apache

# Instala extensiones necesarias de PHP
RUN apt-get update \
    && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libonig-dev zip git unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mbstring tokenizer xml gd

# Habilita mod_rewrite de Apache
RUN a2enmod rewrite

# Instala Composer
COPY --from=composer:1.10 /usr/bin/composer /usr/bin/composer

# Copia el código fuente
COPY . /var/www/html

# Instala las dependencias de Composer
WORKDIR /var/www/html
RUN composer install --no-dev --optimize-autoloader

# Da permisos a las carpetas necesarias
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Expone el puerto 80
EXPOSE 80

# Comando por defecto
CMD ["apache2-foreground"]
