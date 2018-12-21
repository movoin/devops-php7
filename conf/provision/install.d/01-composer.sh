###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/functions.sh"

###
 # Install composer
 ##
cd /tmp
wget https://dl.laravel-china.org/composer.phar
mv /tmp/composer.phar /usr/local/bin/composer
chmod a+x /usr/local/bin/composer

mkdir /root/.composer $APP_PATH/.composer

copyFileTo "$DOCKER_CONF_PATH/etc/composer/config.json" "/root/.composer/config.json"
copyFileTo "$DOCKER_CONF_PATH/etc/composer/config.json" "$APP_PATH/.composer/config.json"

chown -R $APP_USER:$APP_GROUP $APP_PATH/.composer

rm -rf $DOCKER_CONF_PATH/etc/composer/
