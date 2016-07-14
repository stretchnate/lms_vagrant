#
# Cookbook Name:: lms_dev
# Recipe:: php_conf
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#restart apache
service 'httpd' do
	action :nothing
end

# Write the php.ini
template node['lms_dev']['php_ini_path'] do
  source 'php.ini.erb'
  mode '0644'
  notifies :restart, resources(:service => 'httpd')
#  owner node['lms_dev']['user']
#  group node['lms_dev']['group']
end