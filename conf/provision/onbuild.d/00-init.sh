source /opt/docker/bin/functions.sh

# Create php.ini
copyFileTo "/opt/docker/etc/php/php.ini" "/etc/php/conf.d/zzz-docker.ini"

rm -rf /opt/docker/etc/php/
