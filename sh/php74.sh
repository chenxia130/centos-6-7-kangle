#!/bin/bash
files="/root/s-hell"
source $files/config
source $files/iver
rm -rf /root/p* /root/u* u* p*
PREFIX="/vhs/kangle/ext/php74"
phpv=`"$PREFIX"/bin/php -v |grep "$PHP74" -o`
file="php-$PHP74.tar.bz2"
ZEND_ARCH="i386"
LIB="lib"
force_install=$1

release=`cat /etc/*release /etc/*version 2>/dev/null | grep -Eo '([0-9]{1,2}\.){1,3}' | cut -d '.' -f1 | head -1`;
sqlite3_v=`sqlite3 -version | awk -F '.' '{print $1}'`;
sqlite3_v2=`sqlite3 -version | awk -F '.' '{print $2}'`; # 3.7.4
[ "$sqlite3_v" -lt "3" ] || ( [ "$sqlite3_v" -eq "3" ] && [ "$sqlite3_v2" -lt "7" ] ) &&  echo "[Error] Your system(v${release}) is not supported install php-7.4" && exit;

yum -y install oniguruma oniguruma-devel;

if test `arch` = "x86_64"; then
        LIB="lib64"
        ZEND_ARCH="x86_64"
fi
if [ "$PHP74" = "$phpv" ]&&[ "$force_install" != "force"  ];
then {
clear
echo -e "————————————————————————————————————————————————————
检测到您已安装了 PHP-"$phpv" 
不需要重复再次编译安装
————————————————————————————————————————————————————"
exit 1
}
else
{

if [ ! -s /usr/lib64/libzip.so.5 ]; then
yum -y remove libzip libzip-devel
wget --no-check-certificate -O libzip-1.3.2.tar.gz $DOWNLOAD_FILE_URL/file/libzip-1.3.2.tar.gz
tar xvf libzip-1.3.2.tar.gz
cd libzip-1.3.2
./configure
make
make install
ln -s /usr/local/lib/libzip.so.5 /usr/lib64/libzip.so.5
fi

if [ ! -s "$file" ];
then {
wget $DOWNLOAD_FILE_URL/file/php-$PHP74.tar.bz2 -O php-$PHP74.tar.bz2
tar xjf php-$PHP74.tar.bz2
}
else {

tar xjf php-$PHP74.tar.bz2
}
fi
cd php-$PHP74
CONFIG_CMD="./configure --prefix=$PREFIX --with-config-file-scan-dir=$PREFIX/etc/php.d --with-libdir=$LIB --enable-fastcgi --enable-mysqlnd --with-mysql-sock=/var/run/mysql/mysql.sock --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-iconv --with-freetype --with-jpeg --with-png --with-zlib --with-libxml --enable-xml --enable-bcmath --enable-inline-optimization --with-curl --enable-mbregex --enable-mbstring --enable-ftp --with-gd --with-openssl --with-sockets --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-pear --with-gettext --enable-calendar --with-mhash --enable-opcache"
if [ -f /usr/include/mcrypt.h ]; then
        CONFIG_CMD="$CONFIG_CMD --with-mcrypt"
fi
$CONFIG_CMD
if test $? != 0; then
{
	echo $CONFIG_CMD
		echo -e "————————————————————————————————————————————————————
已检测您的系统安装PHP-$PHP74失败.
————————————————————————————————————————————————————";
exit 1
}
else
{
make
make install
mkdir -p $PREFIX/etc/php.d
echo "正在下载PHP7配置文件"
wget -q $DOWNLOAD_URL/config_file/php74.xml -O $PREFIX/config.xml
wget -q $DOWNLOAD_URL/config_file/php74.ini -O $PREFIX/php-templete.ini
#install SourceGuardian
wget $DOWNLOAD_FILE_URL/file/ixed-$ZEND_ARCH-7.4.zip -O ixed-$ZEND_ARCH-7.4.zip
unzip ixed-$ZEND_ARCH-7.4.zip
mkdir -p $PREFIX/ixed
mv -f ixed.7.4.lin $PREFIX/ixed/ixed.7.4.lin

echo "正在清理编译后的垃圾"
rm -rf /tmp/*
/vhs/kangle/bin/kangle -r
rm -rf php-$PHP74
echo -e "————————————————————————————————————————————————————
已检测您的系统成功安装PHP-$PHP74.谢谢您的使用
————————————————————————————————————————————————————"
}
fi
}
fi
