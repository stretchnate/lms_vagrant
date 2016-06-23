1. install vagrant
2. install virtualbox (or vmware_(desktop|fusion))
3. install the chef development kit
4. run
	- vagrant plugin install vagrant-berkshelf
5. clone the repository
	- git clone https://github.com/stretchnate/lms_vagrant.git
6. if necessary make sure you have the lms svn repository checked out/cloned
7. from within the lms directory (recenly cloned git repo) run
	- vagrant up

If you run into any apache or php config issue please let me know so i can update the fix to the chef cookbooks in order to keep this process completly automated.