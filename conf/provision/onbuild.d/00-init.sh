###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/functions.sh"

# Create php.ini
copyFileTo "$DOCKER_CONF_PATH/etc/php/php.ini" "$PHP_INI_DIR/conf.d/zzz-docker.ini"

rm -rf $DOCKER_CONF_PATH/etc/php/
rm -rf /tmp/*
