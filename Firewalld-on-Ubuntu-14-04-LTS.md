# Installing firewalld on UBUNTU 14.04 LTS

* First, check that the universe repository is enabled by inspecting
'/etc/apt/sources.list' with your favourite editor.

	`$ sudo vim /etc/apt/sources.list`

* If universe is not included then modify the file so that it does.
	`deb http://us.archive.ubuntu.com/ubuntu` trusty main universe

* After any changes you should run this command to update your system.

	`$ sudo apt-get update`

* We can now install the package

	`$ sudo apt-get install firewalld`

**Some Commands**

* Start firewalld

	`$ sudo service firewalld start`

* Restart firewalld

	`$ sudo service firewalld restart`

* Stop firewalld

	`$ sudo service firewalld stop`

* Get State / State

	`$ sudo firewall-cmd --state`

* Get Default Zone

	`$ sudo firewall-cmd --get-default-zone`

* Get Active Zone

	`$ sudo firewall-cmd --get-active-zones`

* Get public ports

	`$ sudo firewall-cmd --zone=public --list-ports`

* Allow the default HTTP and HTTPS port to firewall to be public (for example 80)

	`$ sudo firewall-cmd --permanent --add-port=80/tcp`

* Or nor permanent

	`$ sudo firewall-cmd --add-port=80/tcp`

* Remove ports from public (for example 80)

	`$ sudo firewall-cmd --permanent --zone=public --remove-port=80/tcp`

* Or nor permanent

	`$ sudo firewall-cmd --zone=public --remove-port=80/tcp`

* Disable firewallD

	`$ sudo service firewalld disabled`

* Get status firewallD

	`$ sudo service firewalld status`
