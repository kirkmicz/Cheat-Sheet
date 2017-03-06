Nginx (13: Permission denied) while connecting to upstream
=======

This command will fixed the issue

   `$ sudo cat /var/log/audit/audit.log | grep nginx | grep denied | audit2allow -M mynginx`
   
   `$ sudo semodule -i mynginx.pp`

or

   `sudo setsebool -P httpd_can_network_connect 1`
