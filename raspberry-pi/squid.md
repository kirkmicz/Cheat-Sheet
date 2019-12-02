[1]: http://www.squid-cache.org/Versions/        "Squid"

# SQUID + SQUID GUARD TRANSPARENT PROXY SERVER (RASPBERRY PI 4)

---

**REQUIREMENTS**
- Raspbian Buster Lite (OS) installed
- Download latest [Squid] [1] source.
- USB 3.0 TO Ethernet Adapter (atleast 1000 MBPS GIGABIT)

**ASSUMPTION**

You have Raspian installed on your Pi 4 and that its primary LAN `eth0` is configured to use DHCP. It will likely get its address information from your Internet modem/routers. I assume you can connect to it over `eth0`.

## Setting up DHCP

Update repo and upgrade apps already installed from the server.

`$ apt update -y && apt upgrade -y`

Install dnsmasq

`$apt install dnsmasq -y`

By default dnsmasq is running automatically after installed, Stop it for now.

`$ systemctl stop dnsmasq`

Set a static IP address for the second ethernet connection `eth1`. Edit `/etc/dhcpcd.conf `

```
interface eth1
    static ip_address=192.168.7.1/24
```

***Note:*** This IP set `192.168.7.1/24` is only for this tutorial you can actually set on your own.

Back-up and configure `dnsmasq`

```
$ mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
$ vim /etc/dnsmasq.conf
```

Add this lines:

```
interface=eth1
dhcp-range=192.168.7.100,192.168.7.120,255.255.255.0,24h
```

***Note:*** This will define a new DHCP range 192.168.7.x which will be administered by the Pi via eth1.

Now start dnsmasq

`$ systemctl start dnsmasq`

You can even check the connected clients

`$ cat /var/lib/misc/dnsmasq.leases`

IP Forwarding: Edit `/etc/sysctl.conf` and this add line (for persistence)

`net.ipv4.ip_forward=1`

Activate forwarding

`$ sysctl -w net.ipv4.ip_forward=1`

Add a masquerade for outbound traffic on eth0

`$ iptables -t nat -A  POSTROUTING -o eth0 -j MASQUERADE`

## Setting up SQUID

Assuming you've downloaded `squid-4.6.tar.gz`

Extract the file and go to the extracted directory

```
$ tra zxf squid-4.6.tar.gz
$ cd squid-4.6
```

Configure squid

```
$ ./configure --enable-ssl --with-openssl --enable-icmp
```

***Note:*** By default squid will be installed in `/usr/local/squid/` directory. If you want to change the destination set the prefix properly.

and then

```
$ make
$ make install
```

Go to squid directory, back-up and, setting up configuration for `squid.conf`

```
$ cp /usr/local/squid/etc/squid.conf /usr/local/squid/etc/squid.conf.orig
$ vim etc/squid.conf
```

Now before modifying `squid.conf` we need to generate certificates.

```
mkdir /usr/local/squid/etc/ssl_cert
cd /usr/local/squid/etc/ssl_cert

openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -extensions v3_ca -keyout myCA.pem -out myCA.pem

openssl x509 -in myCA.pem -outform DER -out myCA.der
```

After all of this command executed you must see two present files.

```
$ ls

myCA.der  myCA.pem
```

Change `ssl_cert` directory ownership

```
$ chown -R proxy:proxy ssl_cert/
```

Now we will modify the `/usr/local/squid/etc/squid.conf`

Change squid application user as `proxy`

Add this line at the beginning of the file.

```
cache_effective_user proxy
cache_effective_group proxy
```

next change this line from this

```
# Squid normally listens to port 3128
http_port 3128
```

to this

```
http_port 8080
http_port 3128 intercept
https_port 3129 intercept ssl-bump cert=/usr/local/squid/etc/ssl_cert/myCA.pem generate-host-certificates=on dynamic_cert_mem_cache_size=4mb

sslcrtd_program /usr/lib/squid/ssl_crtd -s /var/lib/ssl_db -M 4MB
acl step1 at_step SslBump1
ssl_bump peek step1
ssl_bump bump all
```
You might consider also allowing access from your local network, uncomment this line by just removing `#`

```
http_access allow localnet
```

Start the squid application

```
$ /usr/local/squid/sbin/squid
```

Check if the ports are open

```
$ netstat -tuplen | grep squid

tcp6       0      0 :::3128                 :::*                    LISTEN      0          13175      574/(squid-1)
tcp6       0      0 :::3129                 :::*                    LISTEN      0          14853      578/(squid-1)
tcp6       0      0 :::8080                 :::*                    LISTEN      0          14851      578/(squid-1)
udp        0      0 0.0.0.0:33533           0.0.0.0:*                           13         10200      574/(squid-1)
udp        0      0 0.0.0.0:35828           0.0.0.0:*                           13         13174      578/(squid-1)
udp6       0      0 :::35722                :::*                                13         10199      574/(squid-1)
udp6       0      0 :::43137                :::*                                13         13173      578/(squid-1)
```

For the `status` you may also to check the logs

```
$ /usr/local/squid/var/logs

access.log  cache.log
```

Add firewall rules so the data can pass by back and forth.

```
$ iptables -A INPUT -j ACCEPT -p tcp --dport 3128 -m comment --comment "squid http proxy"
$ iptables -A INPUT -j ACCEPT -p tcp --dport 3129 -m comment --comment "squid https proxy"

$ iptables -t nat -A PREROUTING -s 192.168.7.0/24 -p tcp --dport 80 -m comment --comment "transparent http proxy" -j DNAT --to-destination 192.168.5.13:3128
$ iptables -t nat -A PREROUTING -s 192.168.7.0/24 -p tcp --dport 443 -m comment --comment "transparent https proxy" -j DNAT --to-destination 192.168.5.13:3129
```

***Where:*** `192.168.5.13 (eth0)` is the network on which proxy/squid is running also your default net interface and `192.168.7.0 (eth1)` is the secondary network interface connection on which client will connect.

Now in your client machine import `myCA.der` in your browser so the proxy can validate client requests.
