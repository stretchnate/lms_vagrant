1. install vagrant ~> 1.8.4
	- download from https://www.vagrantup.com

2. install virtualbox ~> 5.0.20 r106931
	- download from https://www.virtualbox.org/wiki/Downloads

3. install the chef development kit ~> 0.15.15
	- download installer from https://downloads.chef.io/chef-dk/

4. install vagrant-berkshelf by running the command below in your terminal
	- vagrant plugin install vagrant-berkshelf

5. clone the repository (or simply go to the url below and download the zip and extract it wherever you want vagrant to run from)
	- git clone https://github.com/stretchnate/lms_vagrant.git

6. cd lms (or cd <whatever you named the folder you unzipped/cloned>)

7. if necessary make sure you have the lms svn repository checked out/cloned

8. from within the lms directory (recenly cloned git repo) run
	- vagrant up

This should install CentOS 7.1 on a new virtualbox environment, install Apache and php on that vbox, sync your local codebase to the vbox environment and configure apache and php.
Once finished you should be able to open a browser and hit either http://glms:8080, http://clms:8080 or http://gams:8080

NOTE: at some point I anticipate forwarding port 80 from the host to the guest machine, when that time comes you'll no longer need to specify a port in the browser. I will update this document when that time comes.

If you run into any apache or php config issue please let me know so i can update the fix to the chef cookbooks in order to keep this process completly automated.