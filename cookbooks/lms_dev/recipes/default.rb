#
# Cookbook Name:: lms_dev
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# include_recipe 'lms_dev::firewall'
# include_recipe 'lms_dev::web_user'
# include_recipe 'lms_dev::web'
# include_recipe 'lms_dev::php'

# execute 'install_apigility' do
# 	command 'curl -sS https://apigility.org/install | php'
# 	# not_if 'yum repolist enabled | grep remi-php7'
# end

execute 'download_sencha_cmd' do
	command 'wget -q -O /tmp/SenchaCmd-6.5.3.6-linux-amd64.sh.zip http://cdn.sencha.com/cmd/6.5.3.6/no-jre/SenchaCmd-6.5.3.6-linux-amd64.sh.zip'
end

execute 'unzip_sencah_cmd' do
	command 'unzip /tmp/SenchaCmd-6.5.3.6-linux-amd64.sh.zip'
end

execute 'install_sencah_cmd' do
	command 'sh /tmp/SenchaCmd-6.5.3.6-linux-amd64.sh'
end

execute 'clone_api_engine' do
	command 'git clone https://bitbucket.org/gabriel0702/quotesapi.git /var/www/html/quotesapi'
end

execute 'clone_mobile_app' do
	command 'git clone https://bitbucket.org/gabriel0702/quotesapp.git /var/www/html/mobileapp'
end

execute 'clone_web_app' do
	command 'git clone https://bitbucket.org/gabriel0702/quoteswebapp.git /var/www/html/webapp'
end