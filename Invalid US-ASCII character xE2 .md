# Sass compiler: Error: Invalid US-ASCII character "\xE2 (CentOS7)

**To Solve This Issue**

*First Option*

- Edit the `.bashrc`, add this line at the top.
  
  `export LANG=en_US.UTF-8`
  
  `export LANG=en_US.UTF-8`
  
  save then `logout` or `exit` the account to take effect.

*Second Option*

- Edit the `locale.conf`, add this line.

  `LC_ALL=en_US.UTF-8`
  
  `LANG=en_US.UTF-8`
  
  save then `logout` or `exit` the account to take effect.
