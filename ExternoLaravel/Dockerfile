FROM php:8.2-fpm

# Instalar dependencias de sistema y PHP
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev zip git unzip libonig-dev libxml2-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Directorio de trabajo
WORKDIR /var/www

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copiar archivos del proyecto
COPY . .

# Instalar dependencias de Laravel
RUN composer install --no-interaction --optimize-autoloader --no-dev

# Exponer el puerto de Artisan
EXPOSE 8000

# Comando para iniciar el servidor
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]