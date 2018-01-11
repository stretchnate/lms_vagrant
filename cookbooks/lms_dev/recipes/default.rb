#
# Cookbook Name:: lms_dev
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'install_git' do
	command 'yum install git -y'
end
include_recipe 'lms_dev::firewall'
include_recipe 'lms_dev::web_user'
include_recipe 'lms_dev::web'
include_recipe 'lms_dev::php'
