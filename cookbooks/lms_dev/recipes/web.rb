#
# Cookbook Name:: lms_dev
# Recipe:: web
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#disable apache's default site
apache_site "default" do
  enable false
end

#conigure virtual hosts
web_app node['server_name'] do |server|
  # template server+'.conf.erb'
  template 'money.local.conf.erb'
  # docroot node['lms_dev']['server_root'] + node[server]['document_root']
  docroot '/var/www/html/budget/public'
  server_name server
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