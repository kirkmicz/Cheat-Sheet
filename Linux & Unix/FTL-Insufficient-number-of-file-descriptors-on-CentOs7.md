# Insufficient number of file descriptors

*Sample error message: FTL Insufficient number of file descriptors: 4672 are needed, but only 1024 are available. Insufficient number of file descriptors: 4672 are needed, but only 1024 are available.*

---

* Display number of allowable open files

  `$ ulimit -n`

* Increase limit permanently by editing /etc/security/limits.conf & add this lines

  `$ * soft  nofile  <number of you desire>`

  `$ * hard  nofile  <number of you desire>`

Then reboot the system.

*Thats it.. Thanks!*
