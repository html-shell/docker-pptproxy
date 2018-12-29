#!/bin/sh

sysctl -w net.ipv4.conf.all.forwarding=1
sysctl -w net.ipv6.conf.all.forwarding=1

cat > /etc/ppp/peers/vpn <<_EOF_
pty "pptp ${SERVER} --nolaunchpppd"
name "${USERNAME}"
password "${PASSWORD}"
remotename PPTP
ipparam vpn
require-mppe-128
file /etc/ppp/options.pptp
_EOF_

route add -net 192.168.0.0 netmask 255.255.0.0 gw 172.17.0.1
tail -f /dev/null
