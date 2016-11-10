#!/usr/bin/env bash
wget http://cn2.php.net/distributions/php-5.5.38.tar.gz

tar xvf php-5.5.38.tar.gz
cd php-5.5.38
./configure --prefix=/root/impress/php\
 --with-libdir=lib64\
 --enable-fpm\
 --with-fpm-user=php-fpm\
 --with-fpm-group=www\
 --enable-mysqlnd\
 --with-mysql=mysqlnd\
 --with-mysqli=mysqlnd\
 --with-pdo-mysql=mysqlnd\
 --enable-opcache\
 --enable-pcntl\
 --enable-mbstring\
 --enable-soap\
 --enable-zip\
 --enable-calendar\
 --enable-bcmath\
 --enable-exif\
 --with-openssl\
 --with-zlib\
 --with-curl\
 --with-gd\
 --with-zlib-dir=/usr/lib\
 --with-png-dir=/usr/lib\
 --with-jpeg-dir=/usr/lib\
 --with-gettext\
 --with-mhash\
 --with-yar

make && make install