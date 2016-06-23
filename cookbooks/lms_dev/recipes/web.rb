#
# Cookbook Name:: lms_dev
# Recipe:: web
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# install mysql client
# mysql_client 'default' do
#   action :create
# end

#install php
include_recipe "php"

# Install php-mysql
package 'php-mysql' do
    action :install
end

#install apache
include_recipe "apache2"

#disable apache's default site
apache_site "default" do
  enable false
end

#conigure glms virtual host
web_app node['glms']['server_name'] do
  template 'glms.conf.erb'
  docroot node['lms_dev']['document_root']
  server_name node['glms']['server_name']
end

#create log dirs
node['lms_dev']['log_dir'].each_value do |dir|
  directory dir do
    action :create
    owner node['lms_dev']['user']
    group node['lms_dev']['group']
    mode '0777'
    recursive true
  end
end

# # Create lib dirs
node['lms_dev']['lib_dir'].each_value do |dir|
  directory dir do
    action :create
    owner node['lms_dev']['user']
    group node['lms_dev']['group']
    mode '0777'
    recursive true
  end
end