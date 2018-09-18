#
# Cookbook Name:: lms_dev
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'lms_dev::firewall'
include_recipe 'lms_dev::web_user'
include_recipe 'lms_dev::web'
include_recipe 'lms_dev::php'

if node['lms_dev']['mariadb_server']['install'] == true
	include_recipe 'lms_dev::mariadb_server'
end
include_recipe 'lms_dev::xdebug'
