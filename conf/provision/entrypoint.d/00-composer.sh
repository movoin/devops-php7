###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/functions.sh"

copyFileTo "$DOCKER_CONF_PATH/etc/composer/config.json" "$APP_PATH/.composer/config.json"
chown -R $APP_USER:$APP_GROUP $APP_PATH/.composer