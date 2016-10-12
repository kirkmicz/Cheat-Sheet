# Supervisor on Ubuntu (daemonize) 14.04.3 LTS

**Install supervisor**
	
  `$ sudo apt-get install supervisor`


  *Note*: Once this has completed, the supervisor daemon should already be started,
  as the prebuilt packages come with an init script that will also ensure the
  Supervisor is restarted after a system reboot. You can ensure this is the
  case by running:

  `$ sudo service supervisor restart`

  *Note*: You can define your own configuration to this path (/etc/supervisor/conf.d/geth.conf)
  as of now we need to create "geth" configuration for ethereum. The following lines below 
  are the sample configuration.


```
[program:sample]
command=node index.js
directory=/home/ubuntu/path/to
autostart=true
autorestart=true
startretries=3
user=bitcoind
stderr_logfile=/home/ubuntu/path/to/sample.err.log
stdout_logfile=/home/ubuntu/path/to/sample.out.log
```


**Some Commands**

* Tell Supervisor to look for any new or changed program configurations in the /etc/supervisor/conf.d
	
	`$ sudo supervisorctl reread`

* Followed by telling it to enact any changes
	
	`$ sudo supervisorctl update`

* Reload Supervisor
	
	`$ sudo supervisorctl reload`

**Supervisor Console**

  `$ sudo supervisorctl`

* Get Status

  `supervisor> status`

* Start "sample.conf"

  `supervisor> start sample`

* Stop "sample.conf"

  `supervisor> stop sample`

* Restart "sample.conf"

  `supervisor> restart sample`
  
