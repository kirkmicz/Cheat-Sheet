# Installing nginx on CentOS7

- Add Centos 7 EPEL repository

	`$ sudo yum install epel-release`

- Install nginx using yum

	`$ sudo yum install nginx`

- Start nginx

	`$ sudo systemctl start nginx`

- If you are running on firewalld, run the ff. command to allow HTTP and HTTPS traffic
     ```
    $ sudo firewall-cmd --permanent --zone=public --add-service=http
	$ sudo firewall-cmd --permanent --zone=public --add-service=https
	$ sudo firewall-cmd --reload
	  ```

- If you want nginx run on boot

	`$ sudo systemctl enable nginx`

- Check if nginx is running and ready to access

	`http://server_domain_name_or_IP/`

- Start Nginx

	`$ sudo systemctl start nginx`

- Stop Nginx

	`$ sudo systemctl stop nginx`

- Check Nginx if running

	`$ ps waux | grep nginx`

- Reload Nginx

	`$ sudo nginx -s reload`
