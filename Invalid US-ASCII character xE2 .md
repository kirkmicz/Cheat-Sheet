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


> *Result*

> - Execute this command to see the result.
  
>  `locale`

> **Note:** either of the two the result should most likely like this

>  ```
> LANG=en_US.UTF-8
>LC_CTYPE="en_US.UTF-8"
>LC_NUMERIC="en_US.UTF-8"
>LC_TIME="en_US.UTF-8"
>LC_COLLATE="en_US.UTF-8"
>LC_MONETARY="en_US.UTF-8"
>LC_MESSAGES="en_US.UTF-8"
>LC_PAPER="en_US.UTF-8"
>LC_NAME="en_US.UTF-8"
>LC_ADDRESS="en_US.UTF-8"
>LC_TELEPHONE="en_US.UTF-8"
>LC_MEASUREMENT="en_US.UTF-8"
>LC_IDENTIFICATION="en_US.UTF-8"
>LC_ALL=en_US.UTF-8
>  ```
