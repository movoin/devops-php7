###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/functions.sh"

###
 # Install composer
 ##
cd /tmp
wget https://mirrors.aliyun.com/composer/composer.phar
mv /tmp/composer.phar /usr/local/bin/composer
chmod a+x /usr/local/bin/composer

mkdir /root/.composer $APP_PATH/.composer

copyFileTo "$DOCKER_CONF_PATH/etc/composer/config.json" "/root/.composer/config.json"
