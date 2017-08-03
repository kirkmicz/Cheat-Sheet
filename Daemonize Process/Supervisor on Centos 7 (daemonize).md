Install supervisord on CentOS 7
===

**Update Repo**

`sudo yum update -y`

**Install pip**

`sudo yum -y install python-pip`

**Install supervisord via pip**

`pip install supervisor`

**Copy config file to /etc**

`sudo echo_supervisord_conf > /etc/supervisord.conf`

**Add your own configuration to the bottom part of supervisord.conf**

```
[program:program-name]
command=<command here>
directory=<path here>
autostart=<true/false>
autorestart=<true/false>
startretries=<number of retries>
user=<username>
stderr_logfile=<path to error logs>
stdout_logfile=<path to output logs>
```

**Start supervisord**

`sudo supervisord -c /etc/supervisord.conf`

*note:*

```
If you encounter like this error:

Error: Another program is already listening on a port that one of our HTTP servers is configured to use.  Shut this program down first before starting supervisord.
```

*Just kill already running supervisord*

```
$ ps -ef | grep supervisord

root   2503  1  0 Nov19 ?  00:03:23 /usr/bin/python /usr/bin/supervisord
root   21337 2556  0 18:15 pts/8   00:00:00 grep --color=auto supervisord

$ kill -s SIGTERM 2503 // to kill 
```

**Apply your configuration**

```
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl reload
```

**Kill all services**

`sudo supervisorctl stop all`

