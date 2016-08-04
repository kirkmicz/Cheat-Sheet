# Installing nginx on UBUNTU 14.04 LTS

- Firstly update the repository

    `$ sudo apt-get update`
    
- Then install nginx

    `$ sudo apt-get install nginx`

- If you are running on firewalld, run the ff. command to allow HTTP and HTTPS traffic

    ```
    $ sudo firewall-cmd --permanent --zone=public --add-service=http
	$ sudo firewall-cmd --permanent --zone=public --add-service=https
	$ sudo firewall-cmd --reload
	  ```

- If you want nginx to run on boot
  
  `$ sudo service nginx enable`

- Check if nginx is running and ready to access

  `http://server_domain_name_or_IP/`

- Start Nginx

	`$ sudo service nginx start`

- Stop Nginx

	`$ sudo service nginx stop`

- Check Nginx if running

	`$ ps waux | grep nginx`

- Reload Nginx

	`$ sudo nginx -s reload`

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
