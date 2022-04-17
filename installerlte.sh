#!/bin/bash

clear
echo "selamat datang di autoinstaller script program modul lte pl100"
sleep 2
echo "bersiap untuk menginstall bahan-bahan yang diperlukan"
sleep 2
echo "menginstall bahan-bahan yang dibutuhkan..."
sleep 2
opkg update && opkg install bash
wget --no-check-certificate "https://raw.githubusercontent.com/vitoharhari/controllerltepl100/main/arlte.sh" -O /usr/bin/arlte.sh && chmod +x /usr/bin/arlte.sh
wget --no-check-certificate "https://raw.githubusercontent.com/vitoharhari/controllerltepl100/main/lte.sh" -O /usr/bin/lte.sh && chmod +x /usr/bin/lte.sh
wget --no-check-certificate "https://raw.githubusercontent.com/vitoharhari/controllerltepl100/main/rebootlte.sh" -O /usr/bin/rebootlte.sh && chmod +x /usr/bin/rebootlte.sh
wget --no-check-certificate "https://raw.githubusercontent.com/vitoharhari/controllerltepl100/main/setlte" -O /usr/bin/setlte && chmod +x /usr/bin/setlte
wget --no-check-certificate "https://raw.githubusercontent.com/vitoharhari/controllerltepl100/main/dapatkaniplte.sh" -O /usr/bin/dapatkaniplte.sh && chmod 777 /usr/bin/dapatkaniplte.sh
sed -i 's/exit 0/ /g' /etc/rc.local
cat <<EOF>> /etc/rc.local
sleep 10
bash /usr/bin/dapatkaniplte.sh &
sleep 40
httping google.com &
exit 0
EOF
