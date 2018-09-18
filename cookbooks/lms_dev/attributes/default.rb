default['firewall']['allow_ssh'] = true
default['firewall']['firewalld']['permanent'] = true
default['lms_dev']['open_ports'] = {
	:http => 80,
	:https => 443,
	:xdebug => 9000,
	:mysql => 3306
}

default['lms_dev']['user'] = 'www'
default['lms_dev']['group'] = '_developer'

default['lms_dev']['server_root'] = '/var/www/html/'

default['lms_dev']['php_ini_path'] = '/etc/php.ini'

default['lms_dev']['var_log_lms'] = '/var/log/lms'

default['lms_dev']['log_dir'] = {
	:daily => '/var/log/lms/daily',
	:debug => '/var/log/lms/debug',
	:leads => '/var/log/lms/leads',
	:memory => '/var/log/lms/memory',
	:rest => '/var/log/lms/rest',
	:ips => '/var/log/ips'
}

default['lms_dev']['lib_dir'] = {
	:cache => '/var/lib/lms/cache',
	'1' => '/var/lib/lms/1',
	'2' => '/var/lib/lms/2',
	'3' => '/var/lib/lms/3',
	'4' => '/var/lib/lms/4',
	'5' => '/var/lib/lms/5',
	'6' => '/var/lib/lms/1/loan_doc_templates',
	'7' => '/var/lib/lms/1/loan_documents',
	'8' => '/var/lib/lms/1/additional_documents',
	'9' => '/var/lib/lms/2/loan_doc_templates',
	'10' => '/var/lib/lms/2/loan_documents',
	'11' => '/var/lib/lms/2/additional_documents',
	'12' => '/var/lib/lms/3/loan_doc_templates',
	'13' => '/var/lib/lms/3/loan_documents',
	'14' => '/var/lib/lms/3/additional_documents',
	'15' => '/var/lib/lms/4/loan_doc_templates',
	'16' => '/var/lib/lms/4/loan_documents',
	'17' => '/var/lib/lms/4/additional_documents',
	'18' => '/var/lib/lms/5/loan_doc_templates',
	'19' => '/var/lib/lms/5/loan_documents',
	'20' => '/var/lib/lms/5/additional_documents',
	'21' => '/var/lib/lms/1/other_documents',
	'22' => '/var/lib/lms/2/other_documents',
	'23' => '/var/lib/lms/3/other_documents',
	'24' => '/var/lib/lms/4/other_documents',
	'25' => '/var/lib/lms/5/other_documents',
	'26' => '/var/lib/ips',
	'27' => '/var/lib/ips/cache'
}

default['server_name'] = {
	:glms => 'glms',
	:clms => 'clms',
	:gams => 'gams',
	:alph => 'alph',
	:ap => 'ap',
	:apcp => 'apcp',
	:cl => 'cl',
	:clcp => 'clcp',
	:gl => 'gl',
	:glcp => 'glcp',
	:ga => 'ga',
	:gacp => 'gacp',
	:qh => 'qh',
	:qhcp => 'qhcp',
	:qhms => 'qhms',
	:ipsi => 'ipsi',
	:rms => 'rms'
}

node.default['https'] = {
	:glms => 'glms',
	:clms => 'clms',
	:gams => 'gams',
	:qhms => 'qhms',
	:alph => 'alph'
}

node.default['server']['common_name'] = ''
node.default['server']['ssl_cert']['source'] = 'self-signed'
node.default['server']['ssl_key']['source'] = 'self-signed'

default['rms'] = {
	:document_root => 'rms/public',
	:ci_env => 'SetEnv CI_ENV development'
}

default['glms'] = {
	:document_root => 'lms/public',
	:ci_env => 'SetEnv CI_ENV development'
}

default['clms'] = {
	:document_root => 'lms/public',
	:ci_env => 'SetEnv CI_ENV development'
}

default['gams'] = {
	:document_root => 'lms/public',
	:ci_env => 'SetEnv CI_ENV development'
}

default['alph'] = {
	:document_root => 'lms/public',
	:ci_env => 'SetEnv CI_ENV development'
}

default['qhms'] = {
	:document_root => 'lms/public',
	:ci_env => 'SetEnv CI_ENV development'
}


#alpha loans
default['ap'] = {
	:document_root => 'cll',
	:ci_env => ''
}

#alpha customer portal
default['apcp'] = {
	:document_root => 'clcp',
	:ci_env => ''
}

#clearline loans
default['cl'] = {
	:document_root => 'cll',
	:ci_env => ''
}

#clearline customer portal
default['clcp'] = {
	:document_root => 'clcp',
	:ci_env => ''
}

#greenline loans
default['gl'] = {
	:document_root => 'gll',
	:ci_env => ''
}

#greenline customer portal
default['glcp'] = {
	:document_root => 'glcp',
	:ci_env => ''
}

#greenarrow loans
default['ga'] = {
	:document_root => 'gal',
	:ci_env => ''
}

#greenarrow customer portal
default['gacp'] = {
	:document_root => 'gacp',
	:ci_env => ''
}

#quickhelp loans
default['qh'] = {
	:document_root => 'qhl',
	:ci_env => ''
}

#quickhelp customer portal
default['qhcp'] = {
	:document_root => 'qhcp',
	:ci_env => ''
}

#ips
default['ipsi'] = {
	:document_root => 'ipsi/public',
	:ci_env => 'SetEnv CI_ENV development'
}


default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = 8
default['java']['oracle']['accept_oracle_download_terms'] = true

default['subversion']['wandisco_repo_path'] = '/etc/yum.repos.d/wandisco-svn.repo'
default['subversion']['version'] = '1.9.7-1'

default['php']['directives'] = {
	"date.timezone" => "America/Boise",
	"error_reporting" => "E_ALL",
	"display_errors" => "On",
	"error_log" => "/var/log/lms/php.log",
	"log_errors_max_len" => 4096,
	"memory_limit" => '4096M',
	"max_input_vars" => 10000,
	"include_path" => '.:'+default['lms_dev']['server_root']+'lms/application:/usr/share/pear:/usr/share/php',
	"short_open_tag" => 'Off'
	#jenkins directives
	#"pcre.recursion_limit" => "10000000",
	#"pcre.backtrack_limit" => "100000000"
}

node.default['phpunit']['install_method'] = 'composer'
node.default['phpunit']['version'] = '6.5'

#/etc/hosts file
node.default['hosts'] = {
	:'127.0.0.1' => 'lms gl glcp glms cl clcp clms ga gacp gams alph ap apcp ipsi'
}

node.default['apache']['locale'] = 'America/Boise'
node.default['apache']['mpm'] = 'prefork'
node.default['apache']['default_modules'] = [
	"mod_access_compat",
	"mod_actions",
	"mod_alias",
	"mod_allowmethods",
	"mod_auth_basic",
	"mod_auth_digest",
	"mod_authn_anon",
	"mod_authn_core",
	"mod_authn_dbd",
	"mod_authn_dbm",
	"mod_authn_file",
	"mod_authn_socache",
	"mod_authz_core",
	"mod_authz_dbd",
	"mod_authz_dbm",
	"mod_authz_groupfile",
	"mod_authz_host",
	"mod_authz_owner",
	"mod_authz_user",
	"mod_autoindex",
	"mod_cache",
	"mod_cache_disk",
	"mod_data",
	"mod_dbd",
	"mod_deflate",
	"mod_dir",
	"mod_echo",
	"mod_env",
	"mod_expires",
	"mod_ext_filter",
	"mod_filter",
	"mod_headers",
	"mod_include",
	"mod_info",
	"mod_log_config",
	"mod_logio",
	"mod_mime_magic",
	"mod_mime",
	"mod_negotiation",
	"mod_remoteip",
	"mod_reqtimeout",
	"mod_rewrite",
	"mod_setenvif",
	"mod_slotmem_plain",
	"mod_slotmem_shm",
	"mod_socache_dbm",
	"mod_socache_memcache",
	"mod_socache_shmcb",
	"mod_status",
	"mod_substitute",
	"mod_suexec",
	"mod_unique_id",
	"mod_unixd",
	"mod_userdir",
	"mod_version",
	"mod_vhost_alias",
	"mod_dav",
	"mod_dav_fs",
	"mod_dav_lock",
	"mod_lua",
	"mod_proxy",
	"mod_lbmethod_bybusyness",
	"mod_lbmethod_byrequests",
	"mod_lbmethod_bytraffic",
	"mod_lbmethod_heartbeat",
	"mod_proxy_ajp",
	"mod_proxy_balancer",
	"mod_proxy_connect",
	"mod_proxy_express",
	"mod_proxy_fcgi",
	"mod_proxy_fdpass",
	"mod_proxy_ftp",
	"mod_proxy_http",
	"mod_proxy_scgi",
	"mod_ssl",
	"mod_systemd",
	"mod_cgi"
]
# #"mod_dumpio","mod_mpm_prefork","libphp5"

#apcu.ini directives
default['apcu'] = {
	:extension => "apcu.so",
	:enabled => 1,
	:enable_cli => 0,
	:preload_path => "",
	:shm_size => "64M",
	:ttl => 7200,
	:gc_ttl => 3600,
	:smart => 0,
	:entries_hint => 4096,
	:mmap_file_mask => "/tmp/apc.XXXXXX",
	:slam_defense => 80,
	:serializer => "'default'",
	:use_request_time => 1,
	:coredump_unmap => 0
}

default['xdebug']['version'] = '2.6.0'
default['xdebug']['config_file'] = '/etc/php.d/40-xdebug.ini'
default['xdebug']['web_server']['service_name'] = 'httpd'
default['xdebug']['directives'] = {
	"default_enable" => 1,
	"remote_enable" => 1,
	"remote_host" => "10.0.2.2",
	"max_nesting_level" => 1000,
	"remote_connect_back" => 1,
	"remote_port" => 9000,
	"remote_handler" => "dbgp",
	"remote_mode" => "req",
	"remote_autostart" => 1,
	"remote_log" => "/var/log/xdebug.log",
	"idekey" => "PHPSTORM"
}

node.default['mariadb']['forbid_remote_root'] = false
node.default['mariadb']['server_root_password'] = 'Integra2018!'
node.default['mariadb']['bind-address'] = '0.0.0.0'
default['lms_dev']['mariadb_server']['install'] = true
default['lms_dev']['mariadb_server']['location'] = '/etc/yum.repos.d/MariaDB.repo'
default['lms_dev']['mariadb_server']['baseurl'] = 'http://yum.mariadb.org/10.1/centos7-amd64'
default['lms_dev']['mariadb_server']['gpgkey'] = 'https://yum.mariadb.org/RPM-GPG-KEY-MariaDB'
default['lms_dev']['mariadb_server']['gpgcheck'] = 1

default['lms_dev']['rewrite_rule']['engine'] = 'RewriteEngine On'
default['lms_dev']['rewrite_rule']['https'] = 'RewriteCond %{HTTPS} off'
default['lms_dev']['rewrite_rule']['https_redirect'] = 'RewriteRule (.*) https://%{SERVER_NAME}/$1 [R,L]'