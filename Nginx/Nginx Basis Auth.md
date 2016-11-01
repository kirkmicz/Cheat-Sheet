(NGINX) BASIC HTTP AUTHENTICATION
=======
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
  
	or
	
  `$ sudo nginx -s reload`
