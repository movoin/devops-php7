#
# Docker Image      movoin/devops-php7
#
# MAINTAINER        Allen Luo <movoin@gmail.com>
# DOCKER-VERSION    18.09.0
#

FROM movoin/devops-centos

ENV PHP_VERSION     7.2.26
ENV PHP_URL         "http://cn.php.net/distributions/php-${PHP_VERSION}.tar.gz"
ENV PHP_INI_DIR     /etc/php

ENV EPEL_URL        "http://mirrors.aliyun.com/repo/epel-7.repo"

COPY conf/          $DOCKER_CONF_PATH

RUN set -x \
    && curl -o /etc/yum.repos.d/epel.repo $EPEL_URL \
    && sed -i 's@gpgcheck=1@gpgcheck=0@g' /etc/yum.repos.d/epel.repo \
    && /usr/local/bin/docker-install \
    autoconf \
    bison \
    flex \
    make \
    gcc \
    gcc-c++ \
    # Bootstrap
    && $DOCKER_CONF_PATH/bin/bootstrap.sh
