#!/bin/bash
rm -f $0 >/dev/null 2>&1
oldns=$(cat /etc/xray/dns)
clear
echo ""
echo ""
read -p " Masukan domain NS yang baru : " newns
sed -i "s/${oldns}/${newns}/g" /etc/systemd/system/client.service
rm -f /etc/xray/dns ; echo "${newns}" > /etc/xray/dns
systemctl restart client server
echo " NS Domain berhasil di ubah ke $newns "
sleep 2
menu
