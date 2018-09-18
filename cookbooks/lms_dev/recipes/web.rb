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
  #default template is vhost
  template_file = 'vhost.conf.erb'
  if node['https'][server]
    #set template to vhost_ssl
    template_file = 'vhost_ssl.conf.erb'
    node.default['server']['common_name'] = server
    cert = ssl_certificate server do
      namespace node['server']
      notifies :restart, 'service[apache2]'
    end
    log server+" certificate is here: #{cert.cert_path}"
    log server+" private key is here: #{cert.key_path}"
    log server+" chain combined path is here: #{cert.chain_combined_path}"
    log server+" chain path is here: #{cert.chain_path}"
  end
  log 'template file is '+template_file
  web_app server do
    server_name server
    docroot node['lms_dev']['server_root'] + node[server]['document_root']
    ci_env node[server]['ci_env']
    template template_file
    if cert
      ssl_key cert.key_path
      ssl_cert cert.cert_path
      ssl_chain cert.chain_path
      redirect_engine node['lms_dev']['rewrite_rule']['engine']
      redirect_https node['lms_dev']['rewrite_rule']['https']
      redirect_https_rule node['lms_dev']['rewrite_rule']['https_redirect']
    end
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