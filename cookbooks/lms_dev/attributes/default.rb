default['firewall']['allow_ssh'] = true
default['firewall']['firewalld']['permanent'] = true
default['lms_dev']['open_ports'] = {
	:http => 80,
	:xdebug => 9000,
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
	:rest => '/var/log/lms/rest'
}

default['lms_dev']['lib_dir'] = {
	:cache => '/var/lib/lms/cache',
	'1' => '/var/lib/lms/1',
	'2' => '/var/lib/lms/2',
	'3' => '/var/lib/lms/3',
	'4' => '/var/lib/lms/4',
	'5' => '/var/lib/lms/1/loan_doc_templates',
	'6' => '/var/lib/lms/1/loan_documents',
	'7' => '/var/lib/lms/1/additional_documents',
	'8' => '/var/lib/lms/2/loan_doc_templates',
	'9' => '/var/lib/lms/2/loan_documents',
	'10' => '/var/lib/lms/2/additional_documents',
	'11' => '/var/lib/lms/3/loan_doc_templates',
	'12' => '/var/lib/lms/3/loan_documents',
	'13' => '/var/lib/lms/3/additional_documents',
	'14' => '/var/lib/lms/4/loan_doc_templates',
	'15' => '/var/lib/lms/4/loan_documents',
	'16' => '/var/lib/lms/4/additional_documents',
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
	:ips => 'ips'
}

default['glms']['document_root'] = 'lms/public'
default['clms']['document_root'] = 'lms/public'
default['gams']['document_root'] = 'lms/public'
default['alph']['document_root'] = 'lms/public'

#alpha loans
default['ap']['document_root'] = 'cll'
#alpha customer portal
default['apcp']['document_root'] = 'clcp'
#clearline loans
default['cl']['document_root'] = 'cll'
#clearline customer portal
default['clcp']['document_root'] = 'clcp'
#greenline loans
default['gl']['document_root'] = 'gll'
#greenline customer portal
default['glcp']['document_root'] = 'glcp'
#greenarrow loans
default['ga']['document_root'] = 'gal'
#greenarrow customer portal
default['gacp']['document_root'] = 'gacp'
#ips
default['ips']['document_root'] = 'ips/public'

default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = 8
default['java']['oracle']['accept_oracle_download_terms'] = true

default['subversion']['wandisco_repo_path'] = '/etc/yum.repos.d/wandisco-svn.repo'

# node.override['php']['version'] = "7.1.13"
# node.override['php']['checksum'] = "12fcbf59c9eb9af215ef38815d5da39b9d74549092c34b0dfc31442699740ce9"
# node.override['php']['url'] = 'http://php.net/get'
default['php']['directives'] = {
	"date.timezone" => "America/Boise",
	"error_reporting" => "E_ALL",
	"display_errors" => "On",
	"error_log" => "/var/log/lms/php.log",
	"log_errors_max_len" => 4096,
	"memory_limit" => '4096M',
	"max_input_vars" => 10000,
	"include_path" => '.:'+default['lms_dev']['server_root']+'lms/application:/usr/share/pear:/usr/share/php',
	#jenkins directives
	#"pcre.recursion_limit" => "10000000",
	#"pcre.backtrack_limit" => "100000000"
}

node.default['phpunit']['install_method'] = 'composer'
# node.default['phpunit']['version'] = '6.5'

#/etc/hosts file
node.default['hosts'] = {
	:'127.0.0.1' => 'lms gl glcp glms cl clcp clms ga gacp gams alph'
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

default['xdebug']['version'] = '2.5.5'
default['xdebug']['config_file'] = '/etc/php.d/xdebug.ini'
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