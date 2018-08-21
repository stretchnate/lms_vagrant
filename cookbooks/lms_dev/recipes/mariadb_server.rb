#
# Cookbook Name:: lms_dev
# Recipe:: mariadb_server
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#conigure mariadb server
template '/etc/yum.repos.d/MariaDB.repo' do
	source 'mariadb_server.repo.erb'
	owner 'root'
	group 'root'
	mode '0644'
end

include_recipe 'mariadb::server'
include_recipe 'mariadb::devel'

mariadb_user 'integra' do
	password 'IntegraGo!'
	host '%'
	privileges [:select]
	action :grant
end

template '/etc/my.cnf' do
	source 'my.cnf.erb'
	owner 'root'
	group 'root'
	mode '0644'
	notifies :restart, resources(:service => 'mysql')
end