#
# Docker Image      movoin/devops-php7
#
# MAINTAINER        Allen Luo <movoin@gmail.com>
# DOCKER-VERSION    1.12.3
#

FROM        movoin/devops-centos
MAINTAINER  Allen Luo <movoin@gmail.com>

ENV PHP_VERSION     7.2.7
ENV PHP_URL         "http://cn.php.net/distributions/php-${PHP_VERSION}.tar.gz"
ENV PHP_INI_DIR     /etc/php

COPY conf/ /opt/docker/

RUN set -x \
    && /usr/local/bin/docker-install \
        autoconf \
        bison \
        flex \
        make \
        gcc \
        gcc-c++ \
    # Install
    && /opt/docker/bin/install.sh \
    # Bootstrap
    && /opt/docker/bin/bootstrap.sh \
    # Clean
    && yum clean all
