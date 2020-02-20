# Deps
BUILDDEPS=" \
	pcre-devel \
	libxml2-devel \
	zlib-devel \
	openssl-devel \
	bzip2-devel \
	curl-devel \
	libedit-devel \
	freetype-devel \
	libjpeg-devel \
	libpng-devel \
	glibc-devel \
	glib2-devel \
	gd-devel \
	gmp-devel
"

/usr/local/bin/docker-install $BUILDDEPS re2c

# Install
cd /tmp
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
	--with-gmp \
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
yum -y erase $BUILDDEPS
