source /opt/docker/bin/functions.sh

mkdir /root/.composer /home/$APP_USER/.composer

chown -R $APP_USER:$APP_GROUP /home/$APP_USER/.composer

copyFileTo "/opt/docker/etc/composer/config.json" "/root/.composer/config.json"
copyFileTo "/opt/docker/etc/composer/config.json" "/home/$APP_USER/.composer/config.json"

rm -rf /opt/docker/etc/composer/
