FROM php:7.4

ARG DEBIAN_FRONTEND=noninteractive

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN apt update && apt install -y \
    zlib1g-dev \
    libpng-dev \
    p7zip-full \
    zip \
    && docker-php-ext-configure gd \
 && docker-php-ext-install gd -j$(nproc)

WORKDIR /app

ENTRYPOINT ["/usr/bin/composer"]
