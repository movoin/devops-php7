source /opt/docker/bin/functions.sh

# Deps
buildDeps=" \
	zlib-devel \
	pcre-devel \
	libxml2-devel \
	openssl-devel \
	bzip2-devel \
	curl-devel \
	libedit-devel \
	freetype-devel \
	libjpeg-devel \
	libpng-devel \
	glibc-devel \
	glib2-devel \
	gd-devel
"

/usr/local/bin/docker-install $buildDeps

# Libzip
cd /tmp
wget https://nih.at/libzip/libzip-1.2.0.tar.gz
tar -zxvf libzip-1.2.0.tar.gz
cd libzip-1.2.0
./configure
make && make install

ln -s /usr/local/lib/libzip/include/zipconf.h /usr/local/include

cd /tmp

rm -f /tmp/libzip-1.2.0.tar.gz
rm -rf /tmp/libzip-1.2.0

# Re2c
cd /tmp
wget https://github.com/skvadrik/re2c/releases/download/0.14.3/re2c-0.14.3.tar.gz
tar -zxvf re2c-0.14.3.tar.gz
cd re2c-0.14.3/
./configure --prefix=/usr/local
make && make install

cd /tmp

rm -f /tmp/re2c-0.14.3.tar.gz
rm -rf /tmp/re2c-0.14.3/

# Install
cd /tmp
wget "$PHP_URL"
tar xzf php-"$PHP_VERSION".tar.gz
cd /tmp/php-"$PHP_VERSION"

./configure \
	--with-config-file-path="$PHP_INI_DIR" \
	--with-config-file-scan-dir="$PHP_INI_DIR/conf.d" \
	--with-curl \
	--with-libedit \
	--with-zlib \
	--with-gd \
	--with-freetype-dir \
	--with-jpeg-dir \
	--with-png-dir \
	--with-mhash \
	--with-openssl \
	--with-gettext \
	--with-libzip \
	--with-libxml-dir=/usr \
	--with-pdo-mysql=mysqlnd \
	--with-mysqli=mysqlnd \
	--with-bz2=/usr \
	--disable-cgi \
	--disable-ipv6 \
	--disable-debug \
	--enable-opcache \
	--enable-fileinfo \
	--enable-rpath \
	--enable-mysqlnd \
	--enable-xml \
	--enable-bcmath \
	--enable-shmop \
	--enable-exif \
	--enable-sysvsem \
	--enable-inline-optimization \
	--enable-pcntl \
	--enable-sockets \
	--enable-zip \
	--enable-soap \
	--enable-mbstring

make -j "$(nproc)"
make install

# Make config directory
mkdir -p $PHP_INI_DIR/conf.d

# Clean
rm -f /tmp/php-"$PHP_VERSION".tar.gz
rm -rf /tmp/php-"$PHP_VERSION"
yum -y erase $buildDeps
yum clean all
