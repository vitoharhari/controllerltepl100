#!/bin/bash

sed -i "/^# AWAL AUTOREBOOT LTE/,/^# AKHIRNAUTOREBOOT LTE/d" /etc/crontabs/root > /dev/null
waktuku="$(cat /root/hasilwaktu.sh | grep -i mytime | cut -d= -f2)"
cat <<EOF>> /etc/crontabs/root
# AWAL AUTOREBOOT LTE
$waktuku * * * rebootlte.sh
# AKHIR AUTOREBOOT LTE
EOF

/etc/init.d/cron restart
