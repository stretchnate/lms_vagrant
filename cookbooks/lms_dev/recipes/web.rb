#
# Cookbook Name:: lms_dev
# Recipe:: web
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# install mysql client
# mysql_client 'default' do
#   action :create
# end

include_recipe "php"

# Install php-mysql
package 'php-mysql' do
    action :install
end

include_recipe "apache2"

apache_site "default" do
  enable false
end

web_app node['glms']['server_name'] do
  template 'glms.conf.erb'
  docroot node['lms_dev']['document_root']
  server_name node['glms']['server_name']
end

#create log dirs
directory node['lms_dev']['log_dir']['daily'] do
  action :create
  owner node['lms_dev']['user']
  group node['lms_dev']['group']
  mode '0777'
  recursive true
end

directory node['lms_dev']['log_dir']['debug'] do
  action :create
  owner node['lms_dev']['user']
  group node['lms_dev']['group']
  mode '0777'
end

directory node['lms_dev']['log_dir']['leads'] do
  action :create
  owner node['lms_dev']['user']
  group node['lms_dev']['group']
  mode '0777'
end

directory node['lms_dev']['log_dir']['memory'] do
  action :create
  owner node['lms_dev']['user']
  group node['lms_dev']['group']
  mode '0777'
end

directory node['lms_dev']['log_dir']['rest'] do
  action :create
  owner node['lms_dev']['user']
  group node['lms_dev']['group']
  mode '0777'
end

# # Create lib dirs
directory node['lms_dev']['lib_dir']['1'] do
  action :create
  owner node['lms_dev']['user']
  group node['lms_dev']['group']
  mode '0777'
  recursive true
end

directory node['lms_dev']['lib_dir']['2'] do
  action :create
  owner node['lms_dev']['user']
  group node['lms_dev']['group']
  mode '0777'
end

directory node['lms_dev']['lib_dir']['3'] do
  action :create
  owner node['lms_dev']['user']
  group node['lms_dev']['group']
  mode '0777'
end

directory node['lms_dev']['lib_dir']['cache'] do
  action :create
  owner node['lms_dev']['user']
  group node['lms_dev']['group']
  mode '0777'
end
