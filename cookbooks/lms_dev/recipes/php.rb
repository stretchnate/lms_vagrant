#
# Cookbook Name:: lms_dev
# Recipe:: php
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

yum_package 'yum-utils' do
	action :install
end

execute 'add_remi' do
	command 'wget -q http://rpms.remirepo.net/enterprise/remi-release-7.rpm'
	not_if 'yum repolist all | grep remi-php71'
end

execute 'add_epel' do
	command 'wget -q https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'
end

execute 'install_remi_epel' do
	command 'rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm'
	not_if 'yum repolist enabled | grep remi-php7'
end

execute 'enable_remi' do
	command 'yum-config-manager --enable remi-php71'
	not_if 'yum repolist enabled | grep remi-php71'
end

execute 'install_php' do
	command 'yum install php -y'
end

execute 'install_php_parts' do
	command 'yum install php-devel php-process php-xml php-pear php-mysql php-mbstring -y'
end
# execute 'yum-update' do
# 	command 'yum update -y'
# end

# include_recipe "composer"
# include_recipe "phpunit"
include_recipe "lms_dev::php_conf"

#create new httpd.conf in /etc/httpd/conf/httpd.conf
template '/etc/httpd/conf/httpd.conf' do
	source 'httpd.conf.erb'
	owner 'root'
	group 'root'
	mode '0644'
	notifies :restart, resources(:service => 'httpd')
end

#yum install php-pecl-apcu
# yum_package 'php-pecl-apcu' do
# 	action :install
# end

#yum install php71-php-pecl-apcu
# yum_package 'php71-php-pecl-apcu' do
# 	action :install
# end

file '/etc/php.d/40-apcu.ini' do
	action :delete
end

file '/etc/php.d/50-apc.ini' do
	action :delete
end

# template '/etc/php.d/40-apcu.ini' do
# 	source 'apcu.ini.erb'
# 	owner 'root'
# 	group 'root'
# 	mode '0644'
# 	notifies :restart, resources(:service => 'httpd')
# end
