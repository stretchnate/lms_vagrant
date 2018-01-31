#
# Cookbook Name:: lms_dev
# Recipe:: web_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe "apache2"

group node['lms_dev']['group']

user node['lms_dev']['user'] do
    group node['lms_dev']['group']
    system true
    shell '/bin/bash'
end

%w{apache dev}.each do |g|
	group g do
		action :modify
		members "vagrant"
		append true
	end
end
