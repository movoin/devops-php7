###
 # Common Functions
 ##
source "$DOCKER_CONF_PATH/bin/functions.sh"

if [ ! -d "$APP_PATH/.composer/" ];then
	mkdir "$APP_PATH/.composer/"
fi

copyFileTo "$DOCKER_CONF_PATH/etc/composer/config.json" "$APP_PATH/.composer/config.json"
chown -R $APP_USER:$APP_GROUP $APP_PATH/.composer