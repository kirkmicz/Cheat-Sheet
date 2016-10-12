# PM2 for Nodejs on Ubuntu (daemonize) 14.04.3 LTS

**Install PM2**
	
  `$ sudo npm install pm2 -g`


**Start Application**
	
  `$ pm2 start index.js`
  

**Stop Application (using app-name or id)**
	
  `$ pm2 stop index`
  
  
**Run On Boot**
	
  `$ pm2 startup ubuntu`


**Restart Application (using app-name or id)**
	
  `$ pm2 restart index`


**Get List of Running Node App**
	
  `$ pm2 list`


**Get Details by (using app-name or id)**
	
  `$ pm2 info index`


**Display Applications Status, CPU & Memory usage**
	
  `$ pm2 monit`
