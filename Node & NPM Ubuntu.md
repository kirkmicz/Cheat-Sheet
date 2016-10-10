# Node & NPM Ubuntu

* Install NodeJS & NPM
	
	```
    $ cd curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -`
    $ sudo apt-get install -y nodejs`
 ```

* for Node.js v6
	
 ```
    $ curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    $ sudo apt-get install -y nodejs
 ```

* Install Build Tools (Optional)
	
	`$ sudo apt-get install -y build-essential`


# Uninstalling

  `$ sudo apt-get purge --auto-remove nodejs`
  
  or
  
  ```
$ sudo apt-get purge nodejs
$ sudo apt-get autoremove
  ```
  
* If `.npm`, `.npmrc`, `npm-global` & `node-gyp` are yet exist you can manually remove that directory.
