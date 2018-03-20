#
# Cookbook Name:: lms_dev
# Recipe:: xdebug
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

if node['xdebug']['version'] == 'latest'
	version = ''
else
	version = '-'+node['xdebug']['version']
end

execute 'add_xdebug' do
	command "pecl install xdebug#{version}"
	not_if 'pecl list | grep xdebug'
end

template node['xdebug']['config_file'] do
	source 'xdebug.ini.erb'
	owner 'root'
	group 'root'
	mode 0644
	unless node['xdebug']['web_server']['service_name'].empty?
		notifies :restart, resources("service[#{node['xdebug']['web_server']['service_name']}]"), :delayed
	end
end

directives = node['xdebug']['directives']

unless directives.nil?
	if directives.key?('remote_log')
		file directives['remote_log'] do
			owner 'root'
			group 'root'
			mode 0777
			not_if { directives['remote_log'].empty? }
		end
	end
end