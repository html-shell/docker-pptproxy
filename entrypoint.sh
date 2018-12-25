#!/bin/sh

#VPN_NAME
#VPN_SERVER_IP
#VPN_USERNAME
#VPN_PASSWORD
pptpsetup --create "vpn_name" --server $SERVER --username $USERNAME --password $PASSWORD --encrypt --start
sleep 2
ip route replace default dev ppp0

tail -f /dev/null
