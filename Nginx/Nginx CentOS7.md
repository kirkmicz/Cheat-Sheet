# Installing nginx on CentOS7

* Add Centos 7 EPEL repository

	`$ sudo yum install epel-release`

* Install nginx using yum

	`$ sudo yum install nginx`

* Start nginx

	`$ sudo systemctl start nginx`

* If you are running on firewalld, run the ff. command to allow HTTP and HTTPS traffic
     ```
    $ sudo firewall-cmd --permanent --zone=public --add-service=http
	$ sudo firewall-cmd --permanent --zone=public --add-service=https
	$ sudo firewall-cmd --reload
	  ```

* If you want nginx run on boot

	`$ sudo systemctl enable nginx`

* Check if nginx is running and ready to access

	`http://server_domain_name_or_IP/`

* Start Nginx

	`$ sudo systemctl start nginx`

* Stop Nginx

	`$ sudo systemctl stop nginx`

* Check Nginx if running

	`$ ps waux | grep nginx`

* Reload Nginx

	`$ sudo nginx -s reload`


## Setup Basic HTTP Authentication with nginx

* The `htpassword` is the reponsible for the restriction access to the target website, this command is under the `httpd-tools` package. So we need to install the package first.

   `$ sudo yum install -y httpd-tools`

* Configuring HTTP Basic Authentication Credentials, So we will now create the password.

   `$ sudo htpasswd -c /etc/nginx/.htpasswd nginx`

* Check the contents of newly-created file

   `$ cat /etc/nginx/.htpasswd`

* It will look like this

   `nginx:$apr1$QmjTfXYI$LJiJyGlzE6vQXLVBLgSpY/`

* Then update the configuration on nginx, Here's the example:
  ```
  ...
  server {
    listen       80 default_server;
    listen       [::]:80 default_server;
    server_name  _;
    root         /usr/share/nginx/html;

    auth_basic "Private Property";
    auth_basic_user_file /etc/nginx/.htpasswd;
    ...
   ```

* Reload nginx

  `$ sudo systemctl reload nginx`


## Cannot Reverse Proxy

* Other devs are not using `firewalld` in some cases nginx `reverse_proxy` cannot serve as expected because SELinux is preventing the connection as there is no policy allowing the connection. Therefore we need to tell SELinux to allow that.

* Run this in root account

`$ setsebool -P httpd_can_network_connect true`
