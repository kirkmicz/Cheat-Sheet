# Laravel on Ubuntu 16.04 LTS

**Update Repository**

  `$ sudo apt-get update`

**Install php7.0**
	
  ```
  $ sudo apt-get install php7.0-*
  
  //Remove php7.0-snmp
  $ sudo apt-get remove php7.0-snmp
  ```
**Install Composer**

  `$ sudo apt-get install composer`
  
**Install Laravel**

  `$ composer global require "laravel/installer"`

# Setting Up Laravel

**Create bashrc for laravel**

  ```
  $  cd ~/.config/composer/vendor/bin
  
  //Get current location and copy
  $ pwd
  
  //Now using your favorite editor open .bashrc file (using vim)
  $ vim ~/.bashrc
  
  //At the end of the line add this text
  export PATH=$PATH:/the/one/you/copy/laravel/location/
  
  //Then execute this command
  $ source ~/.bashrc
  
  //Now check if laravel succesfully installed
  $ laravel --help
  ```

# Optional

**Go to html directory**

  `$ cd /var/www/html`

**Make laravel folder**

  `$ sudo mkdir laravel`
  
**Change permission**

  `$ sudo chmod 777 laravel/`
  
**Go to laravel**

  `$ cd laravel`

**Create new project**

  `$ laravel new <project name here>`

**Go to your new project directory and run this command**

  `$ php artisan serve`



 
![alt text](https://avatars3.githubusercontent.com/u/6651513?v=3&s=400 "Kirkmicz")


*Thats it.. Thanks!*
