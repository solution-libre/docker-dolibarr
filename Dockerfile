# Copyright (C) 2023 Solution Libre <contact@solution-libre.fr>
# 
# This file is part of Dolibarr with Docker Compose.
# 
# Dolibarr with Docker Compose is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# Dolibarr with Docker Compose is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with Dolibarr with Docker Compose.  If not, see <https://www.gnu.org/licenses/>.

ARG DOLIBARR_VERSION=latest

FROM dolibarr/dolibarr:${DOLIBARR_VERSION}

LABEL org.opencontainers.image.authors='Solution Libre <contact@solution-libre.fr>'\
      org.opencontainers.image.licenses=GPL-3.0-or-later\
      org.opencontainers.image.title=Dolibarr\
      org.opencontainers.image.description='Open Source ERP & CRM for business'\
      org.opencontainers.image.url=https://github.com/solution-libre/docker-dolibarr\
      org.opencontainers.image.vendor='Solution Libre'\
      org.opencontainers.image.version=v0.1.0

ARG MEMCACHED_ENABLED=false\
    XDEBUG_ENABLED=false

RUN if [ "${MEMCACHED_ENABLED}" = 'true' -o "${MEMCACHED_ENABLED}" = 'yes' ]; then\
      apt-get update\ 
      && apt-get install -y libz-dev libmemcached-dev libmemcachedutil2\
      && yes '' | pecl install -f --configureoptions 'enable-memcached-sasl="no"'  memcached\
      && docker-php-ext-enable memcached\
      && apt-get autoremove --purge -y libz-dev libmemcached-dev\
      && rm -rf /var/lib/apt/lists/*\
    ;fi

RUN if [ "${XDEBUG_ENABLED}" = 'true' -o "${XDEBUG_ENABLED}" = 'yes' ]; then\
      pecl install xdebug\
      && docker-php-ext-enable xdebug\
    ;fi
