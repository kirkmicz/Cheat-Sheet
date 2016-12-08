#Install supervisord on CentOS 7

---

#####1. Update Repo

`sudo yum -y update`

#####2. Install Supervisor

######Method 1

`sudo easy_install supervisor`

######Method 2

Download the following using wget

[python setup tools]

[meld3]

[elementtree]

[python setup tools]: <http://pypi.python.org/pypi/setuptools>
[meld3]: <http://www.plope.com/software/meld3/>
[elementtree]: <http://effbot.org/downloads#elementtree>

then invoke this command

`python setup.py install`

and run supervisord

`sudo supervisord`

######Method 3
Install supervisord via pip

`pip install supervisor`


#####3. Checking If The Supervisor is install correctly

`echo_supervisord_conf`

*sample result*

```
; Sample supervisor config file.
;
; For more information on the config file, please see:
; http://supervisord.org/configuration.html
;
; Notes:
;  - Shell expansion ("~" or "$HOME") is not supported.  Environment
;    variables can be expanded using this syntax: "%(ENV_HOME)s".
;  - Comments must have a leading space: "a=b ;comment" not "a=b;comment".

[unix_http_server]
file=/tmp/supervisor.sock   ; (the path to the socket file)
;chmod=0700                 ; socket file mode (default 0700)
;chown=nobody:nogroup       ; socket file uid:gid owner
;username=user              ; (default is no username (open server))
;password=123               ; (default is no password (open server))

;[inet_http_server]         ; inet (TCP) server disabled by default
;port=127.0.0.1:9001        ; (ip_address:port specifier, *:port for all iface)
;username=user              ; (default is no username (open server))
;password=123               ; (default is no password (open server))

[supervisord]
logfile=/tmp/supervisord.log ..

...
......

;[include]
;files = relative/directory/*.ini
```

#####4. Creating Configuration File

 `sudo echo_supervisord_conf > /your/path/supervisord.conf`

#####5. Adding the program to configuration

`sudo vim /etc/supervisord.conf`

*add config to the lower part of the content*

```
[program:coinect-bot]
command=<command here>
directory=<path here>
autostart=<true/false>
autorestart=<true/false>
startretries=<number of retries>
user=<username>
stderr_logfile=<path to error logs>
stdout_logfile=<path to output logs>
```

#####6. Running the supervisor

`sudo supervisord`

or

`sudo supervisorctl`

#####7. Supervisorctl commands:


`sudo supervisorctl reread` : Re-read for checking the update of the config.


`sudo supervisorctl update` : Update for stop and updating the process.

`sudo supervisorctl reload` : Re-load for reloading the cron process.

`sudo supervisorctl status` : Status of all running application.

`sudo supervisorctl stop all` : Kill all services running in the server.

or

`sudo supervisorctl`

`supervisor> reread` : read all for checking the update of the config.

`supervisor> update` : stop and update the configs.

`supervisor> reload` : restarting all running configs.

`supervisor> stop all` : stop all running configs and exit in **supervisorctl**.
