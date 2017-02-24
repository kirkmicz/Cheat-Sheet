#!/bin/bash
# Init
FILE="/tmp/out.$$"
GREP="/bin/grep"
#....
# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

cat <<EOT
  ___  ____  _____ _   ___     ______  _   _
 / _ \|  _ \| ____| \ | \ \   / /  _ \| \ | |
| | | | |_) |  _| |  \| |\ \ / /| |_) |  \| |
| |_| |  __/| |___| |\  | \ V / |  __/| |\  |
 \___/|_|   |_____|_| \_|  \_/  |_|   |_| \_|

 ___           _        _ _            __   _______        ___
|_ _|_ __  ___| |_ __ _| | | ___ _ __  \ \ / / _ \ \      / / |
 | || '_ \/ __| __/ _\` | | |/ _ \ '__|  \ V / | | \ \ /\ / /| |
 | || | | \__ \ || (_| | | |  __/ |      | || |_| |\ V  V / |_|
|___|_| |_|___/\__\__,_|_|_|\___|_|      |_| \___/  \_/\_/  (_)
EOT

cat <<EOT
===========================================
============= Updating system =============
===========================================
EOT
apt-get update -y
wait $!

cat <<EOT
===========================================
============ Upgrading system =============
===========================================
EOT
apt-get upgrade -y
wait $!

cat <<EOT
===========================================
========== Installing speed test ==========
===========================================
EOT
apt-get install speedtest-cli -y
wait $!

cat <<EOT
===========================================
======== Installing build-essential =======
========= gcc, make, upstart-sysv =========
============== vim and wget ===============
===========================================
EOT
apt-get install build-essential gcc make upstart-sysv vim wget -y
wait $!

cat <<EOT
===========================================
========== Downloading Softether ==========
===========================================
EOT
wget http://www.softether-download.com/files/softether/v4.20-9608-rtm-2016.04.17-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.20-9608-rtm-2016.04.17-linux-x64-64bit.tar.gz
wait $!

cat <<EOT
===========================================
=========== Unzipping Softether ===========
===========================================
EOT
tar xvf softether-vpnserver-v4.20-9608-rtm-2016.04.17-linux-x64-64bit.tar.gz
wait $!

cat <<EOT
===========================================
== Move vpnserver folder to /usr/local/ ===
===========================================
EOT
mv vpnserver /usr/local/
wait $!

cat <<EOT
===========================================
======= Go to /usr/local/vpnserver/ =======
===========================================
EOT
cd /usr/local/vpnserver/
wait $!

cat <<EOT
===========================================
========== Execute make command ===========
===========================================
EOT
make
wait $!

cat <<EOT
===========================================
======= Changing file permissions =========
===========================================
EOT
chmod 755 vpn*
chmod +x vpnserver
chmod +x vpncmd
wait $!

cat <<EOT
===========================================
=== Creating vpnserver in /etc/init.d/ ====
===========================================
EOT
touch /etc/init.d/vpnserver
wait $!

cat <<EOT
===========================================
============ Appending Scripts ============
===========================================
EOT
cat <<EOT >> /etc/init.d/vpnserver
  #!/bin/sh
  # chkconfig: 2345 99 01
  # description: SoftEther VPN Server
  DAEMON=/usr/local/vpnserver/vpnserver
  LOCK=/var/lock/subsys/vpnserver
  test -x $DAEMON || exit 0
  case "$1" in
  start)
  $DAEMON start
  touch $LOCK
  ;;
  stop)
  $DAEMON stop
  rm $LOCK
  ;;
  restart)
  $DAEMON stop
  sleep 3
  $DAEMON start
  ;;
  *)
  Usage: $0 {start|stop|restart}
  exit 1
  esac
  exit 0
EOT
wait $!

cat <<EOT
===========================================
=== Making subsys folder in /var/lock/ ====
===========================================
EOT
mkdir /var/lock/subsys
wait $!

cat <<EOT
===========================================
==== Changing vpnserver permissions =======
===========================================
EOT
chmod 755 /etc/init.d/vpnserver
wait $!

cat <<EOT
===========================================
=========== Starting vpnserver ============
===========================================
EOT
/etc/init.d/vpnserver start
wait $!

cat <<EOT
===========================================
============ Setting up locale ============
===========================================
EOT
update-rc.d vpnserver defaults
wait $!

cat <<EOT
===========================================
=========== Installing apache2 ============
===========================================
EOT
apt-get install apache2 -y
wait $!

cat <<EOT
===========================================
========= Appending Configuration =========
===========================================
EOT

echo "ServerName " `dig +short myip.opendns.com @resolver1.opendns.com` >> /etc/apache2/apache2.conf
cat <<EOT >> /etc/apache2/apache2.conf
Listen 8123

ProxyRequests On
ProxyVia On
EOT
wait $!

cat <<EOT
===========================================
=========== Installing aptitude ===========
===========================================
EOT
apt-get install aptitude -y
wait $!

cat <<EOT
===========================================
============ Updating aptitude ============
===========================================
EOT
aptitude update
wait $!

cat <<EOT
===========================================
============ Upgrading aptitude ===========
===========================================
EOT
aptitude -y upgrade
wait $!

cat <<EOT
===========================================
== Installing libapache2-mod-proxy-html ===
============= and libxml2-dev =============
===========================================
EOT
aptitude install -y libapache2-mod-proxy-html libxml2-dev
wait $!

cat <<EOT
===========================================
======== Executing command (a2enmod) ======
===========================================
EOT
#proxy proxy_ajp proxy_http rewrite deflate headers proxy_balancer proxy_connect proxy_html
a2enmod
wait $!

cat <<EOT
===========================================
============= Starting Apached ============
===========================================
EOT
service apache2 restart
wait $!

cat <<EOT
===========================================
=========== Creating export path ==========
===========================================
EOT
export PATH=$PATH:/usr/local/vpnserver/
export PATH=$PATH:/etc/init.d/
wait $!

cat <<EOT
 ____                     ___           _        _ _ _
|  _ \  ___  _ __   ___  |_ _|_ __  ___| |_ __ _| | (_)_ __   __ _
| | | |/ _ \| '_ \ / _ \  | || '_ \/ __| __/ _\` | | | | '_ \ / _\` |
| |_| | (_) | | | |  __/  | || | | \__ \ || (_| | | | | | | | (_| |
|____/ \___/|_| |_|\___| |___|_| |_|___/\__\__,_|_|_|_|_| |_|\__, |
                                                             |___/
EOT

echo "Check Internet Speed"
speedtest-cli
wait $!
echo "Done"
