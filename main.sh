#!/bin/bash
files="/root/s-hell"
tmpfile="/root/hl-tmp" 
source $files/config

function Installall(){
	cd $tmpfile
	rm -rf $files/log/install.log
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	wget -q $DOWNLOAD_URL/pre.sh -O pre.sh;sh pre.sh
}
function Installcdn(){
	cd $tmpfile
	rm -rf $files/log/install.log
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	wget -q $DOWNLOAD_URL/pre.sh -O pre.sh;sh pre.sh no
}
function Check(){
	cd $tmpfile
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	wget -q $DOWNLOAD_URL/check.sh -O check.sh;sh check.sh
}
function Resql(){
	cd $tmpfile
	rm -rf $files/log/iset.log
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	wget -q $DOWNLOAD_URL/sh/iset.sh -O iset.sh;sh iset.sh | tee $files/log/iset.log
}
function Resql2(){
	cd $tmpfile
	rm -rf $files/log/reset.log
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	wget -q $DOWNLOAD_URL/sh/reset.sh -O reset.sh;sh reset.sh | tee $files/log/reset.log
}
function Upyum(){
	isC7=`cat /etc/redhat-release |grep ' 7.'`
	if [ "${isC7}" == "" ];then
		wget -q $DOWNLOAD_FILE_URL/repo/Centos-6.repo -O /etc/yum.repos.d/CentOS-Base.repo
		rpm -ivh $DOWNLOAD_FILE_URL/repo/epel-release-latest-6.noarch.rpm --nodeps --force
		wget -q $DOWNLOAD_FILE_URL/repo/epel-6.repo -O /etc/yum.repos.d/epel.repo
	else
		wget -q $DOWNLOAD_FILE_URL/repo/Centos-7.repo -O /etc/yum.repos.d/CentOS-Base.repo
		rpm -ivh $DOWNLOAD_FILE_URL/repo/epel-release-latest-7.noarch.rpm --nodeps --force
		wget -q $DOWNLOAD_FILE_URL/repo/epel-7.repo -O /etc/yum.repos.d/epel.repo
	fi
	yum clean all
}
function Uninstall(){
	cd $tmpfile
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	wget -q $DOWNLOAD_URL/uninstall.sh -O uninstall.sh;sh uninstall.sh
}
function Rephp(){
	cd $tmpfile
	wget -q $DOWNLOAD_URL/sh/rephp.sh -O rephp.sh;sh rephp.sh
}
function SetDNS(){
	echo -e "———————————————————————————
	\033[1mＫＡＮＧＬＥＳＯＦＴ\033[0m
	\033[32m修复系统DNS\033[0m
	1. 114DNS（国内服务器）
	2. 谷歌DNS（国外服务器）"
	read -p "请输入序号并回车:" YORN
	if [ "$YORN" = "2" ]; then
		echo -e "options timeout:1 attempts:1 rotate\nnameserver 8.8.8.8\nnameserver 8.8.4.4" >/etc/resolv.conf;
		echo "已经成功更改为谷歌DNS"
	else
		echo -e "options timeout:1 attempts:1 rotate\nnameserver 114.114.114.114\nnameserver 114.114.115.115" >/etc/resolv.conf;
		echo "已经成功更改为114DNS"
	fi
}
function Ntpdate(){
	\cp -a -r /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
	service ntpd stop
	echo 'Synchronizing system time...'
	ntpdate 0.asia.pool.ntp.org
	echo "同步服务器时间成功"
}

function install_upm(){
	cd $tmpfile
	rm -rf $files/log/upm.log
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	wget -q $DOWNLOAD_URL/sh/upm.sh -O pm.sh;sh pm.sh | tee $files/log/pm.log
}
function install_fxp(){
	cd $tmpfile
	rm -rf $files/log/fxp.log
	wget -q $DOWNLOAD_URL/sh/fixphp.sh -O fixphp.sh;sh fixphp.sh | tee $files/log/fxp.log
}
function install_fxd(){
	cd $tmpfile
	rm -rf $files/log/fxd.log
	wget -q $DOWNLOAD_URL/sh/fixdomain.sh -O fixdomain.sh;sh fixdomain.sh | tee $files/log/fxd.log
}
function install_php(){
	cd $tmpfile
	rm -rf $files/log/php*.log
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	wget -q $DOWNLOAD_URL/sh/php53.sh -O php53.sh;sh php53.sh | tee $files/log/php53.log
	wget -q $DOWNLOAD_URL/sh/php54.sh -O php54.sh;sh php54.sh | tee $files/log/php54.log
	wget -q $DOWNLOAD_URL/sh/php55.sh -O php55.sh;sh php55.sh | tee $files/log/php55.log
	wget -q $DOWNLOAD_URL/sh/php56.sh -O php56.sh;sh php56.sh | tee $files/log/php56.log
	wget -q $DOWNLOAD_URL/sh/php7.sh -O php7.sh;sh php7.sh | tee $files/log/php7.log
	wget -q $DOWNLOAD_URL/sh/php71.sh -O php71.sh;sh php71.sh | tee $files/log/php71.log
	wget -q $DOWNLOAD_URL/sh/php72.sh -O php72.sh;sh php72.sh | tee $files/log/php72.log
	wget -q $DOWNLOAD_URL/sh/php73.sh -O php73.sh;sh php73.sh | tee $files/log/php73.log
	wget -q $DOWNLOAD_URL/sh/php74.sh -O php74.sh;sh php74.sh | tee $files/log/php74.log
}
function install_php_force(){
	cd $tmpfile
	rm -rf $files/log/php*.log
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	wget -q $DOWNLOAD_URL/sh/php53.sh -O php53.sh;sh php53.sh force | tee $files/log/php53.log
	wget -q $DOWNLOAD_URL/sh/php54.sh -O php54.sh;sh php54.sh force | tee $files/log/php54.log
	wget -q $DOWNLOAD_URL/sh/php55.sh -O php55.sh;sh php55.sh force | tee $files/log/php55.log
	wget -q $DOWNLOAD_URL/sh/php56.sh -O php56.sh;sh php56.sh force | tee $files/log/php56.log
	wget -q $DOWNLOAD_URL/sh/php7.sh -O php7.sh;sh php7.sh force | tee $files/log/php7.log
	wget -q $DOWNLOAD_URL/sh/php71.sh -O php71.sh;sh php71.sh force | tee $files/log/php71.log
	wget -q $DOWNLOAD_URL/sh/php72.sh -O php72.sh;sh php72.sh force | tee $files/log/php72.log
	wget -q $DOWNLOAD_URL/sh/php73.sh -O php73.sh;sh php73.sh force | tee $files/log/php73.log
	wget -q $DOWNLOAD_URL/sh/php74.sh -O php74.sh;sh php74.sh force | tee $files/log/php74.log
}
function install_phpc(){
	cd $tmpfile
	rm -rf $files/log/php*.log
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	wget -q $DOWNLOAD_URL/sh/php.sh -O php.sh
	sh php.sh php53| tee $files/log/php.log
	sh php.sh php54| tee $files/log/php.log
	sh php.sh php55| tee $files/log/php.log
	sh php.sh php56| tee $files/log/php.log
	sh php.sh php70| tee $files/log/php.log
	sh php.sh php71| tee $files/log/php.log
	sh php.sh php72| tee $files/log/php.log
	sh php.sh php73| tee $files/log/php.log
	sh php.sh php74| tee $files/log/php.log
}
function install_phpc_force(){
	cd $tmpfile
	rm -rf $files/log/php*.log
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	wget -q $DOWNLOAD_URL/sh/php.sh -O php.sh
	sh php.sh php53 force| tee $files/log/php.log
	sh php.sh php54 force| tee $files/log/php.log
	sh php.sh php55 force| tee $files/log/php.log
	sh php.sh php56 force| tee $files/log/php.log
	sh php.sh php70 force| tee $files/log/php.log
	sh php.sh php71 force| tee $files/log/php.log
	sh php.sh php72 force| tee $files/log/php.log
	sh php.sh php73 force| tee $files/log/php.log
	sh php.sh php74 force| tee $files/log/php.log
}
function install_ioncube(){
	cd $tmpfile
	rm -rf $files/log/ioncube.log
	wget -q $DOWNLOAD_URL/sh/ioncube.sh -O ioncube.sh;sh ioncube.sh | tee $files/log/ioncube.log
	rm -rf $tmpfile/*
}
function install_ixed(){
	cd $tmpfile
	rm -rf $files/log/ixed.log
	wget -q $DOWNLOAD_URL/sh/ixed.sh -O ixed.sh;sh ixed.sh | tee $files/log/ixed.log
	rm -rf $tmpfile/*
}
function phpini(){
	cd $tmpfile
	wget -q $DOWNLOAD_URL/sh/phpini.sh -O phpini.sh;sh phpini.sh
}
function install_mysql(){
	#设置MySQL密码
	mysql_root_password=""
	read -p "请输入您需要设置的MySQL密码(留空则随机生成):" mysql_root_password
	if [ "$mysql_root_password" = "" ]; then
	mysql_root_password=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 15`
	fi
	echo '[OK] Your MySQL password is:';
	echo $mysql_root_password;

	cd $tmpfile
	rm -rf $files/log/sql.log
	wget -q $DOWNLOAD_URL/sh/sql.sh -O sql.sh;sh sql.sh $mysql_root_password | tee $files/log/sql.log
}
function install_kangle(){
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	source $files/iver
	cd $tmpfile
	echo -e "———————————————————————————
	\033[1mＫＡＮＧＬＥＳＯＦＴ\033[0m
	\033[32mKangle版本选择\033[0m
	（极速安装均为商业版,经典版均不支持CentOS 7）
	1. 极速安装 Kangle 3.5.21 最新版 
	2. 编译安装 Kangle 3.5.21 开发版
	3. 极速安装 Kangle 3.5.14 经典版
	4. 极速安装 Kangle 3.5.10 经典版
	5. 极速安装 Kangle 3.4.8 经典版
	6. 编译安装 Kangle 3.4.8 经典版"
	read -p "请输入序号并回车:" YORN
	if [ "$YORN" = "2" ]; then
		kangle_var="$KANGLE_VERSION";
		rm -rf $files/log/kangle.log
		wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
		wget -q $DOWNLOAD_URL/sh/kangle.sh -O kangle.sh;sh kangle.sh $kangle_var 0 | tee $files/log/kangle.log
	elif [ "$YORN" = "3" ]; then
		kangle_var="3.5.14.13";
		rm -rf $files/log/kangle.log
		wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
		wget -q $DOWNLOAD_URL/sh/kangle.sh -O kangle.sh;sh kangle.sh $kangle_var 1 | tee $files/log/kangle.log
	elif [ "$YORN" = "4" ]; then
		kangle_var="$KANGLE_ENT_VERSION";
		rm -rf $files/log/kangle.log
		wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
		wget -q $DOWNLOAD_URL/sh/kangle.sh -O kangle.sh;sh kangle.sh $kangle_var 1 | tee $files/log/kangle.log
	elif [ "$YORN" = "5" ]; then
		kangle_var="$KANGLE_OLD_VERSION";
		rm -rf $files/log/kangle.log
		wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
		wget -q $DOWNLOAD_URL/sh/kangle.sh -O kangle.sh;sh kangle.sh $kangle_var 1 | tee $files/log/kangle.log
	elif [ "$YORN" = "6" ]; then
		kangle_var="$KANGLE_OLD_VERSION";
		rm -rf $files/log/kangle.log
		wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
		wget -q $DOWNLOAD_URL/sh/kangle.sh -O kangle.sh;sh kangle.sh $kangle_var 0 | tee $files/log/kangle.log
	else
		kangle_var="$KANGLE_NEW_VERSION";
		rm -rf $files/log/kangle.log
		wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
		wget -q $DOWNLOAD_URL/sh/kangle.sh -O kangle.sh;sh kangle.sh $kangle_var 1 | tee $files/log/kangle.log
	fi
}
function install_easypanel(){
	cd $tmpfile
	rm -rf $files/log/ep.log
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	wget -q $DOWNLOAD_URL/sh/ep.sh -O ep.sh;sh ep.sh force | tee $files/log/ep.log
}
function install_phpmyadmin(){
	cd $tmpfile
	rm -rf $files/log/pm.log
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	wget -q $DOWNLOAD_URL/sh/pm.sh -O pm.sh;sh pm.sh | tee $files/log/pm.log
}
function setvhms(){
	wget -q $DOWNLOAD_URL/sh/vhms.sh -O vhms.sh;sh vhms.sh
}
function Update(){
	cd $tmpfile
	links="https://github.com/chenxia130/centos-6-7-kangle/raw/master"
	wget -q $links/config -O $files/config
	wget -q $links/main.sh -O main.sh;
	cp -f main.sh /usr/bin/kanglesh
	echo "更新成功"
	sh main.sh
	exit 0;
}
function flowcron(){
	sed -i 's/tpl_php52/php56/g' /etc/cron.d/ep_sync_flow
	sed -i 's/php53/php56/g' /etc/cron.d/ep_sync_flow
	/etc/init.d/crond restart
	echo -e "修改保存成功
"
}
function Easypanel_view(){
	cd $tmpfile
	wget -q $DOWNLOAD_URL/sh/view.sh -O view.sh;sh view.sh
}
function Resetpwd(){
	clear
	read -p "请输入Kangle管理员-新用户名：" ep_admin
	echo -e "\033[44;37m 你输入Kangle管理员-新用户名是：$ep_admin \033[0m"
	read -p "请输入Kangle管理员-新密码：" ep_passwd
	echo -e "\033[44;37m 你输入Kangle管理员-新密码是：$ep_passwd \033[0m"
	# passwdmd5=` echo -n '$ep_passwd'|md5sum|cut -d ' ' -f1 `
	nl /vhs/kangle/etc/config.xml | sed -i "s/admin user='.*' password='.*' a/admin user='$ep_admin' password='$ep_passwd' a/g" /vhs/kangle/etc/config.xml
	service kangle restart
	echo "Kangle管理员账户&密码已修改成功"
}
function Clean(){
	echo "正在执行清理垃圾任务，执行时间由文件数量决定，请耐心等待。。。"
	rm -rf /vhs/kangle/tmp/*
	rm -rf /vhs/kangle/var/*.log
	rm -rf /tmp
	mkdir /tmp
	chmod -R 777 /tmp
	/vhs/kangle/bin/kangle --reboot

	echo "清理垃圾文件释放空间执行完毕！"
}
function Safedog(){
	cd $tmpfile
	yum -y install mlocate lsof pciutils dmidecode psmisc
	wget http://download.safedog.cn/safedog_linux64.tar.gz -O safedog_linux64.tar.gz
	tar xvzf safedog_linux64.tar.gz
	cd safedog_an_linux64_*
	chmod +x *.py
	./install.py
	/usr/bin/sdcmd webflag 0
	/usr/bin/sdcmd twreuse 1
	/usr/bin/sdcmd sshddenyflag 1
	echo "安全狗Linux版安装完毕！"
	echo "执行以下命令加入服云：sdcloud -u 你的用户名"
	#卸载命令：./uninstall.py
}
function SafedogUninstall(){
	cd $tmpfile
	cd safedog_an_linux64_*
	./uninstall.py
}
function Auto_Swap()
{
	swap=$(free |grep Swap|awk '{print $2}')
	if [ "${swap}" -gt 1 ];then
		echo "Swap total sizse: $swap";
		return;
	fi
	swapFile="/home/swap"
	dd if=/dev/zero of=$swapFile bs=1M count=1025
	mkswap -f $swapFile
	swapon $swapFile
	echo "$swapFile    swap    swap    defaults    0 0" >> /etc/fstab
	swap=`free |grep Swap|awk '{print $2}'`
	if [ $swap -gt 1 ];then
		echo "Swap total sizse: $swap";
		return;
	fi
	
	sed -i "/\/home\/swap/d" /etc/fstab
	rm -f $swapFile
}
function Ipset(){
	echo -e "———————————————————————————
	\033[1mＫＡＮＧＬＥＳＯＦＴ\033[0m
	\033[32mKangle配合ipset防CC\033[0m
	1. 安装并配置ipset防CC
	2. 取消配置ipset防CC"
	read -p "请输入序号并回车:" YORN
	if [ "$YORN" = "1" ]; then
		release=`cat /etc/*release /etc/*version 2>/dev/null | grep -Eo '([0-9]{1,2}\.){1,3}' | cut -d '.' -f1 | head -1`;
		if [ "$release" -eq "7" ]; then
			yum install -y iptables iptables-services
			systemctl stop firewalld
			systemctl disable firewalld
			chmod +x /etc/rc.d/rc.local
		fi
		yum install -y ipset
		ipset create kangle hash:ip hashsize 4096 maxelem 1000000
		echo "/usr/sbin/ipset create kangle hash:ip hashsize 4096 maxelem 1000000" >> /etc/rc.d/rc.local
		iptables -I INPUT -m set --match-set kangle src -p tcp -m multiport --destination-port 80,81,443,3312,3313 -j DROP
		service iptables save
		service iptables restart
		wget -q $DOWNLOAD_URL/config_file/iptables.xml -O /vhs/kangle/ext/iptables.xml
		/vhs/kangle/bin/kangle --reboot
		echo "ipset防CC安装并配置成功"
	else
		rm -f /vhs/kangle/ext/iptables.xml
		/vhs/kangle/bin/kangle --reboot
		ipset flush
		echo "ipset防CC取消配置成功"
	fi
}

function XtraBackup()
{
	yum -y install perl perl-devel libev libev-devel rsync perl-Time-HiRes perl-DBD-MySQL
	release=`cat /etc/*release /etc/*version 2>/dev/null | grep -Eo '([0-9]{1,2}\.){1,3}' | cut -d '.' -f1 | head -1`;
	if [ "$release" -eq "7" ]; then
		rpm -ivh --force $DOWNLOAD_FILE_URL/file/percona-xtrabackup-24-2.4.20-1.el7.x86_64.rpm
	elif test `arch` = "x86_64"; then
		rpm -ivh --force $DOWNLOAD_FILE_URL/file/percona-xtrabackup-24-2.4.20-1.el6.x86_64.rpm
	else
		rpm -ivh --force $DOWNLOAD_FILE_URL/file/percona-xtrabackup-24-2.4.20-1.el6.i686.rpm
	fi
}

function cdnbest()
{
	rm -rf $files/log/cdnbest.log
	wget -q $DOWNLOAD_URL/lg/install_ver.h -O $files/iver
	wget -q $DOWNLOAD_URL/sh/cdnbest.sh -O cdnbest.sh;sh cdnbest.sh | tee $files/log/cdnbest.log
}

function mysql_ini(){
	cd $tmpfile
	echo -e "———————————————————————————
	\033[1mＫＡＮＧＬＥＳＯＦＴ\033[0m
	\033[32mMysql配置文件(my.cnf)选择\033[0m
	（更改配置文件之后会重启数据库）
	1. 适合1~2G内存的服务器（默认）
	2. 适合4G内存的服务器
	3. 适合8G内存的服务器
	4. 适合16G内存的服务器"
	read -p "请输入序号并回车:" YORN
	if [ "$YORN" = "2" ]; then
		wget -q $DOWNLOAD_URL/config_file/my2.cnf -O /etc/my.cnf
	elif [ "$YORN" = "3" ]; then
		wget -q $DOWNLOAD_URL/config_file/my3.cnf -O /etc/my.cnf
	elif [ "$YORN" = "4" ]; then
		wget -q $DOWNLOAD_URL/config_file/my4.cnf -O /etc/my.cnf
	else
		wget -q $DOWNLOAD_URL/config_file/my.cnf -O /etc/my.cnf
	fi
	service mysqld restart
}

function InstallPHP(){
clear
echo -e "————————————————————————————————————————————————————
	\033[1mＫＡＮＧＬＥＳＯＦＴ\033[0m
	\033[32mKangle一键脚本-单独安装PHP\033[0m
	说明：以下内容已经包含在'安装全部'里面
————————————————————————————————————————————————————
1. ◎ 自动安装/更新 PHP5.3-7.4（极速安装）
2. ◎ 自动安装/更新 PHP5.3-7.4（编译安装）
3. ◎ 重新安装 PHP5.3-7.4（极速安装）
4. ◎ 重新安装 PHP5.3-7.4（编译安装）
5. ◎ 自动更新 ionCube组件
6. ◎ 自动更新 SG11组件
7. ◎ 重置全部PHP版本php.ini文件
0. ◎ 返回上一级菜单"
read -p "请输入序号并回车：" num
case "$num" in
[1] ) (install_phpc);;
[2] ) (install_php);;
[3] ) (install_phpc_force);;
[4] ) (install_php_force);;
[5] ) (install_ioncube);;
[6] ) (install_ixed);;
[7] ) (phpini);;
[0] ) (Install);;
*) (InstallPHP);;
esac
}

function Tools(){
clear
echo -e "————————————————————————————————————————————————————
	\033[1mＫＡＮＧＬＥＳＯＦＴ\033[0m
	\033[32mKangle一键脚本-Linux工具箱\033[0m
————————————————————————————————————————————————————
1. ◎ 重置系统Yum源
2. ◎ 修改系统DNS设置
3. ◎ 同步服务器时间
4. ◎ 清理垃圾文件释放空间
5. ◎ 安装安全狗Linux版
6. ◎ 卸载安全狗Linux版
7. ◎ 初始化Swap虚拟内存（适合小内存机器）
8. ◎ Kangle配合ipset防CC
9. ◎ 安装XtraBackup2.4
a. ◎ Mysql配置文件更换
0. ◎ 返回上一级菜单"
read -p "请输入序号并回车：" num
case "$num" in
[1] ) (Upyum);;
[2] ) (SetDNS);;
[3] ) (Ntpdate);;
[4] ) (Clean);;
[5] ) (Safedog);;
[6] ) (SafedogUninstall);;
[7] ) (Auto_Swap);;
[8] ) (Ipset);;
[9] ) (XtraBackup);;
[a] ) (mysql_ini);;
[0] ) (Init);;
*) (Install);;
esac
}

function Install(){
clear
echo -e "————————————————————————————————————————————————————
	\033[1mＫＡＮＧＬＥＳＯＦＴ\033[0m
	\033[32mKangle一键脚本-单独安装\033[0m
	说明：以下内容已经包含在'安装全部'里面
————————————————————————————————————————————————————
1. ◎ 安装/更新 Kangle 组件
2. ◎ 安装/更新 Easypanel 组件
3. ◎ 安装/更新多版本 PHP 组件
4. ◎ 重新安装 MySQL5.6
5. ◎ 设置VHMS计划任务
6. ◎ 修复EP流量统计计划任务
7. ◎ 安装 cdnbest 最新版
8. ◎ 安装 phpMyAdmin
0. ◎ 返回上一级菜单"
read -p "请输入序号并回车：" num
case "$num" in
[1] ) (install_kangle);;
[2] ) (install_easypanel);;
[3] ) (InstallPHP);;
[4] ) (install_mysql);;
[5] ) (setvhms);;
[6] ) (flowcron);;
[7] ) (cdnbest);;
[8] ) (install_phpmyadmin);;
[0] ) (Init);;
*) (Install);;
esac
}

function Init(){
clear
echo -e "————————————————————————————————————————————————————
	\033[1mＫＡＮＧＬＥＳＯＦＴ\033[0m
	\033[32mKangle一键脚本-主菜单\033[0m
	说明：kanglesh命令可随时打开当前菜单
————————————————————————————————————————————————————
1. ◎ 安装全部 Kangle/Easypanel/PHP/Mysql
2. ◎ 安装全部 Kangle/Easypanel/PHP (CDN专用)
3. ◎ 单独安装/更新组件
4. ◎ 更换 Easypanel 模板
5. ◎ 重置MySQL数据库密码
6. ◎ 重置Kangle后台登录密码
7. ◎ 自定义卸载PHP版本
8. ◎ 完全卸载Kangle
9. ◎ Linux工具箱
a. ◎ 更新当前脚本
0. ◎ 退出安装"
read -p "请输入序号并回车：" num
case "$num" in
[1] ) (Installall);;
[2] ) (Installcdn);;
[3] ) (Install);;
[4] ) (Easypanel_view);;
[5] ) (Resql);;
[6] ) (Resetpwd);;
[7] ) (Rephp);;
[8] ) (Uninstall);;
[9] ) (Tools);;
[a] ) (Update);;
[0] ) (exit);;
*) (Init);;
esac
}

Init
