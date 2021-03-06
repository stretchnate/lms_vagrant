#
# Cookbook Name:: lms_dev
# Recipe:: subversion_client
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Write the repo
template node['subversion']['wandisco_repo_path'] do
  source 'wandisco-svn.repo.erb'
  mode '0644'
end

# yum_package 'subversion'

execute 'install_subversion' do
	command "yum install subversion-#{node['subversion']['version']} -y"
	not_if "subversion --version | grep #{node['subversion']['version']}"
end