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