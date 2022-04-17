#!/bin/bash
sleep 10
{ echo "nvram_get cache wan_ipaddr"; echo "nvram_get cache wan_primary_dns"; sleep 2; } | telnet 169.254.0.1 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -v "169.254.0.1"  > /tmp/ipmodem.txt

ethdataip=$(ifconfig modem.103 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')
lteip=$(head -1 /tmp/ipmodem.txt)
ltedns=$(tail -1 /tmp/ipmodem.txt)
if [ -z "$lteip" ]
then
        sleep 10
else
        if [ "$ethdataip" != "$lteip" ]; then
                uci set network.eth_data.ipaddr="$lteip"
                uci set network.eth_data.dns="$ltedns"
                uci commit network
                /etc/init.d/network reload
                ip route add default dev modem.103
                #sleep 60
        fi
fi
exit
