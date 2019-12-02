[1]: http://www.squid-cache.org/Versions/        "Squid"

# SQUID + SQUID GUARD TRANSPARENT SERVER (RASPBERRY PI 4)

**REQUIREMENTS**
- Raspbian Buster Lite (OS) installed
- Download latest [Squid] [1] source.
- USB 3.0 TO Ethernet Adapter (atleast 1000 MBPS GIGABIT)

**ASSUMPTION**

You have Raspian installed on your Pi 4 and that its primary LAN `eth0` is configured to use DHCP. It will likely get its address information from your Internet modem/routers. I assume you can connect to it over `eth0`.

## Setting up DHCP

Update repo and upgrade apps already installed from the server.

`apt update -y && apt upgrade -y`

Install dnsmasq

`apt install dnsmasq -y`

By default dnsmasq is running automatically after installed, Stop it for now.

`systemctl stop dnsmasq`

Set a static IP address for the second ethernet connection `eth1`. Edit `/etc/dhcpcd.conf `

```
interface eth1
    static ip_address=192.168.7.1/24
```

***Note:*** This IP set `192.168.7.1/24` is only for this tutorial you can actually set on your own.

Back-up and configure `dnsmasq`

```
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
vim /etc/dnsmasq.conf
```

Add this lines:

```
interface=eth1
dhcp-range=192.168.7.100,192.168.7.120,255.255.255.0,24h
```

***Note:*** This will define a new DHCP range 192.168.7.x which will be administered by the Pi via eth1.

Now start dnsmasq

`systemctl start dnsmasq`

You can even check the connected clients

`cat /var/lib/misc/dnsmasq.leases`

IP Forwarding: Edit `/etc/sysctl.conf` and this add line (for persistence)

`net.ipv4.ip_forward=1`

Activate forwarding

`sysctl -w net.ipv4.ip_forward=1`

Add a masquerade for outbound traffic on eth0

`iptables -t nat -A  POSTROUTING -o eth0 -j MASQUERADE`
