1. install vagrant ~> 2.1.2
	- download from https://www.vagrantup.com

2. install virtualbox ~> 5.2
	- download from https://www.virtualbox.org/wiki/Downloads

3. install the chef development kit ~> 3.1.0
	- download installer from https://downloads.chef.io/chef-dk/

4. If you are updating a current vagrant install simply run 'vagrant plugin repair' and then move on to step 5, otherwise continue with steps 4a and 4b

4a. install vagrant-berkshelf by running the command below in your terminal
	- vagrant plugin install vagrant-berkshelf

4b. install the omnibus plugin so we can tell vagrant what chef version to install on the client (This is especially crucial on Sierra)
	- vagrant plugin install vagrant-omnibus

5. clone the repository (or simply go to the url below and download the zip and extract it wherever you want vagrant to run from)
	- cd ~
	- mkdir Projects -m 0777
	- mkdir Projects/Vagrant -m 0777
	- cd Projects/Vagrant
	- git clone https://github.com/stretchnate/lms_vagrant.git lms

6. cd lms (or cd <whatever you named the folder you unzipped/cloned>)

7. Ensure you have the lms svn repository checked out/cloned
NOTE: if you choose a different location for your code repository in step 7 you will need to change the location in Vagrantfile for config.vm.synced folder for '/var/www/html' to the location you used.
Likewise, you will need to adjust the symlink in step 8 to fit your location

8. Ensure that you have a symlink from /var/www/html/library to /var/www/html/lms/library, if you don't have the symlink run the below command.
	- ln -s /var/www/html/library /var/www/html/lms/library

9. from within the lms directory (recenly cloned git repo) run
	- sudo vagrant up

This should install CentOS 7.1 on a new virtualbox environment, install Apache and php on that vbox, sync your local codebase to the vbox environment and configure apache and php.
Once finished you should be able to open a browser and hit either http://glms, http://clms or http://gams

### Special Circumstances
NOTE: if you wish to forward a port other than port 80 to vagrant you must modify the host setting on the 'config.vm.network :forwarded_port, guest: 80, host: 80' line in the Vagrntfile to have the port you wish to forward to.
NOTE: if you are using /var/www/html as your docroot for svn you will need to run the following commands so you can edit and commit changes (without using sudo) after you have checked out the repositories.

sudo chown -R _www:_developer /var/www

sudo chmod -R 775 /var/www

If you run into any apache or php config issue please let me know so i can update the fix to the chef cookbooks in order to keep this process completly automated.


### Configuring PHPStorm and XDebug
#### Add a PHP interpreter
1. Open Settings / Preferences [command + ,]
2. Click PHP under Langauages & Frameworks
3. Click the ... button next to CLI Interpreter
4. Click the + to add an interpreter
5. Choose SSH Credentials
6. Specify credentials
	1. Username: vagrant
	2. Password: vagrant
	3. port: 2222
	4. Debugger Extension: /usr/lib64/php/modules/xdebug.so
7. Click Appy / OK as often as needed to get it all saved

#### Configure PHP Remote Debug
1. Click on Run in the menu
2. Click on Edit Configurations
3. Expand "Defaults" in the left panel
4. Click on PHP Remote Debug
5. Click on the ... button next to "Servers"
	* Name: glms
	* Host: glms
	* Port: 80
	* Debugger: xdebug
	* Map /var/www/html/lms to /var/www/html/lms (local -> remote)
6. Click "Apply" / "OK" until you're happy.

#### Start the debugger listening
Click "Run" in the menu then click "Start Listening for PHP Debug Connections"

NOTE: You will need the Xdebug Helper chrome extension (or a firefox equivalent)

### Configuring Netbeans and XDebug
#### Configure Debugging port and session id
1. Open Preferences
2. Click PHP
3. Click the Debugging tab
4. ensure Debugger port is set to 9000
5. set Session ID to 'netbeans-xdebug'
6. Click OK

#### Configure Project
1. open projects window
2. right click on desired project <lms>
3. click "properties"
4. click "Run Configuration"
5. click "Advanced" button
6. set debug url to default
7. in the path mapping box add the following 
	* /var/www/html/lms/public -> /var/www/html/lms/public (Server Path -> Project Path)
8. Click "OK"
9. Click "OK"

#### Start the debugger
Click "Debug" (in menu) -> Debug Project (or you can hold the control key while pressing F5)

No special browser extensions are needed for netbeans
