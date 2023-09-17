FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    git   \
    curl  \
    zip \
    unzip \
    libapache2-mod-php \
    package-foo=1.3.* \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite

WORKDIR /var/www/html

COPY . /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
