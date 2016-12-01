# FTL Insufficient number of file descriptors: 4672 are needed, but only 1024 are available. Insufficient number of file descriptors: 4672 are needed, but only 1024 are available.

---

* Display number of allowable open files

  `$ ulimit -n`

* Increase limit permanently by editing /etc/security/limits.conf & add this lines

  `$ * soft  nofile  <number of you desire>`
  `$ * hard  nofile  <number of you desire>`

Then reboot the system.




![alt text](https://avatars3.githubusercontent.com/u/6651513?v=3&s=400 "Kirkmicz")


*Thats it.. Thanks!*
