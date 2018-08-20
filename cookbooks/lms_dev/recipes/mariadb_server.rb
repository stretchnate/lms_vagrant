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

include_recipe 'mariadb::default'