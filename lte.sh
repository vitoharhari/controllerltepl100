#!/bin/bash
# Versi modifikasi dari script oleh langit7
# Oleh: Kopijahe and AlkhaNET

apn=$(cat /root/hasilapn.sh | grep -i apnku | cut -d= -f2)
# Set APN1 ke "internet" atau "aha"
{ echo ucfg set config wan lte apntable apn1 apn_name "$apn"; sleep 1; } | telnet 169.254.0.1 && exit

