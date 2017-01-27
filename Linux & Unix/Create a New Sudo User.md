# Create a New Sudo User

* Log in to your server as the root user

  `$ ssh root@<server_ip_address>`

* Use the adduser command to add a new user to your system.

  `$ adduser <username>`

* Use the passwd command to update the new user's password

  `$ passwd <username>`

* Use the usermod command to add the user to the wheel group.

  `$ usermod -aG wheel <username>`



## Remove prompting password when executing command with `sudo`

* Log in to your server as the root user

  `$ ssh root@<server_ip_address>`

* Open /etc/sudoers

  `$ visudo`

* Open /etc/sudoers

  `$ visudo`

* Uncomment this line

  ```
    ## Same thing without a password
    %wheel  ALL=(ALL)       NOPASSWD: ALL
  ```


## Enable ssh access to user

* Generate key pair

  `$ ssh-keygen -t rsa`

* Change `.ssh` folder permission

  `sudo chmod 700 .ssh`

* Create `authorized_keys` file inside `.ssh` folder if not exist

  `sudo touch authorized_keys`

  Open `authorized_keys` and paste your `public_key`.

* Change `authorized_keys` file permission

  `sudo chmod 600 .ssh/authorized_keys`

* Change `authorized_keys` file ownership

  `chown admin:admin .ssh/authorized_keys`


## Change ssh port and security

* First backup sshd_config

  `sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak`

* Open sshd using your editor and modify values

  `sudo vim /etc/ssh/sshd_config`

  ```  
  Protocol 2

  Port <port>

  PermitRootLogin no
  AllowUsers admin
  PermitEmptyPasswords no
  PubkeyAuthentication yes
  PasswordAuthentication no
  ```

## Enable the newly created port through SELinux

* Enable port
  
  `sudo semanage port -a -t ssh_port_t -p tcp <port>`

* run this command if semanage command not found

  `sudo yum -y install policycoreutils-python`

* allow new port through firewalld

  `sudo firewall-cmd --permanent --zone=public --add-port=<port>/tcp`

* reload firewalld

  `sudo firewall-cmd --reload`

* restart sshd

  `sudo systemctl restart sshd.service`
