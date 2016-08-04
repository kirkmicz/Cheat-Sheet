# Firewalld-on-CentOS7

- Install firewalld
	$ sudo yum install firewalld -y


**Some Commands**

* Start
	
	`$ sudo systemctl start firewalld.service`

* Restart
	
	`$ sudo systemctl restart firewalld.service`

* Reload
	
	`$ sudo firewall-cmd --reload`

* Stop firewallD
	
	`$ sudo systemctl stop firewalld`

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

	`$ systemctl disable firewalld`

* Get status firewallD

	`$ sudo systemctl status firewalld`
