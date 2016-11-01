Nginx (13: Permission denied) while connecting to upstream
=======

This command will fixed the issue

   `$ sudo cat /var/log/audit/audit.log | grep nginx | grep denied | audit2allow -M mynginx`
   
   `$ sudo semodule -i mynginx.pp`
