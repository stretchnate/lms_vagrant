#def random_password
#	require 'securerandom'
#	SecureRandom.base64
#end

default['firewall']['allow_ssh'] = true
default['firewall']['firewalld']['permanent'] = true
default['lms_dev']['open_ports'] = 80

default['lms_dev']['user'] = 'www'
default['lms_dev']['group'] = '_developer'

default['lms_dev']['document_root'] = '/var/www/lms/public'
default['lms_dev']['httpd_conf'] = '/etc/httpd/conf/httpd.conf'
default['lms_dev']['php_ini_path'] = '/etc/php.ini'

default['lms_dev']['log_dir']['daily'] = '/var/log/lms/daily'
default['lms_dev']['log_dir']['debug'] = '/var/log/lms/debug'
default['lms_dev']['log_dir']['leads'] = '/var/log/lms/leads'
default['lms_dev']['log_dir']['memory'] = '/var/log/lms/memory'
default['lms_dev']['log_dir']['rest'] = '/var/log/lms/rest'

default['lms_dev']['lib_dir']['1'] = '/var/lib/lms/1'
default['lms_dev']['lib_dir']['2'] = '/var/lib/lms/2'
default['lms_dev']['lib_dir']['3'] = '/var/lib/lms/3'
default['lms_dev']['lib_dir']['cache'] = '/var/lib/lms/cache'

default['glms']['server_name'] = 'glms'

node.default['php']['directives'] = {"date.timezone" => "America/Boise"}

node.default['apache']['locale'] = 'America/Boise'
node.default['apache']['mpm'] = 'prefork'
node.default['apache']['default_modules'] = ["mod_access_compat","mod_actions","mod_alias","mod_allowmethods","mod_auth_basic","mod_auth_digest","mod_authn_anon","mod_authn_core","mod_authn_dbd","mod_authn_dbm","mod_authn_file","mod_authn_socache","mod_authz_core","mod_authz_dbd","mod_authz_dbm","mod_authz_groupfile","mod_authz_host","mod_authz_owner","mod_authz_user","mod_autoindex","mod_cache","mod_cache_disk","mod_data","mod_dbd","mod_deflate","mod_dir","mod_echo","mod_env","mod_expires","mod_ext_filter","mod_filter","mod_headers","mod_include","mod_info","mod_log_config","mod_logio","mod_mime_magic","mod_mime","mod_negotiation","mod_remoteip","mod_reqtimeout","mod_rewrite","mod_setenvif","mod_slotmem_plain","mod_slotmem_shm","mod_socache_dbm","mod_socache_memcache","mod_socache_shmcb","mod_status","mod_substitute","mod_suexec","mod_unique_id","mod_unixd","mod_userdir","mod_version","mod_vhost_alias","mod_dav","mod_dav_fs","mod_dav_lock","mod_lua","mod_proxy","mod_lbmethod_bybusyness","mod_lbmethod_byrequests","mod_lbmethod_bytraffic","mod_lbmethod_heartbeat","mod_proxy_ajp","mod_proxy_balancer","mod_proxy_connect","mod_proxy_express","mod_proxy_fcgi","mod_proxy_fdpass","mod_proxy_ftp","mod_proxy_http","mod_proxy_scgi","mod_ssl","mod_systemd","mod_cgi","php5"]
#"mod_dumpio","mod_mpm_prefork","libphp5"

#Apache 2.2 modules, don't really work on 2.4 well
# node.default['apache']['default_modules'] = ["mod_systemd", "mod_authz_core", "mod_authn_file", "mod_authz_host", "mod_authz_groupfile", "mod_authz_user", "mod_auth_basic", "mod_auth_digest", "mod_deflate", "mod_log_config", "mod_env", "mod_expires", "mod_headers", "mod_setenvif", "mod_proxy", "mod_proxy_connect", "mod_proxy_http", "mod_proxy_ajp", "mod_proxy_balancer", "mod_ssl", "mod_mime", "mod_status", "mod_autoindex", "mod_cgi", "mod_dav_fs", "mod_negotiation", "mod_dir", "mod_actions", "mod_alias", "mod_rewrite"]
# "mod_authn_file", "mod_authz_host", "mod_authz_groupfile", "mod_authz_user", "mod_auth_basic", "mod_auth_digest", "mod_deflate", "mod_log_config", "mod_env", "mod_expires", "mod_headers", "mod_setenvif", "mod_proxy", "mod_proxy_connect", "mod_proxy_http", "mod_proxy_ajp", "mod_proxy_balancer", "mod_ssl", "mod_mime", "mod_status", "mod_autoindex", "mod_cgi", "mod_dav_fs", "mod_negotiation", "mod_dir", "mod_actions", "mod_alias", "mod_rewrite"]
#"mod_php5", "mod_authz_default"
#default_unless['lms_dev']['database']['root_password'] = random_password
#default_unless['lms_dev']['database']['admin_password'] = random_password
#default['lms_dev']['database']['dbname'] = 'my_company'
#default['lms_dev']['database']['host'] = '127.0.0.1'
#default['lms_dev']['database']['root_username'] = 'root'
#default['lms_dev']['database']['admin_username'] = 'db_admin'