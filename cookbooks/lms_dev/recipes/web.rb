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
# include_recipe "php"

# Install php-mysql
package 'php-mysql' do
    action :install
end

#install mbstring
package 'php-mbstring' do
  action :install
end

#install apache
include_recipe "apache2"

#disable apache's default site
apache_site "default" do
  enable false
end

#install gcc compiler
package "gcc" do
  action :install
end

#install apc for php
php_pear "apc" do
  action :install
  directives(:shm_size => "128M", :ttl => 7200, :user_ttl => 7200, :gc_ttl => 3600, :slam_defense => 80)
end

#install memcached and it's dependencies
package "libevent" do
  action :install
end

package "libevent-devel" do
  action :install
end

package "memcached" do
  action :install
end

package "php-pecl-memcache" do
  action :install
end
#end install memcached and it's dependencies

#conigure virtual hosts
node['server_name'].each_value do |server|
  web_app server do
    template server+'.conf.erb'
    docroot node['lms_dev']['server_root'] + node[server]['document_root']
    server_name server
  end
end

#create /var/log/lms
directory node['lms_dev']['var_log_lms'] do 
  action :create
  owner node['lms_dev']['user']
  group node['lms_dev']['group']
  mode '0777'
  recursive true
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

file node['php']['directives']['error_log'] do
  owner node['lms_dev']['user']
  group node['lms_dev']['group']
  mode '0777'
end

node['hosts'].each_pair do |ipaddress, hosts|
  hostsfile_entry ipaddress do
    hostname hosts
    action :create
  end
end