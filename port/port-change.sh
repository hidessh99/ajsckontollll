#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }




clear
echo -e ""
echo -e "${cyan}======================================${off}"
echo -e "            ${green}PENGATURAN PORT${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
echo -e "     1 ⸩  Ubah Port Stunnel4"
echo -e "     2 ⸩  Ubah Port OpenVPN"
echo -e "     3 ⸩  Ubah Port Trojan"
echo -e "${off}"
echo -e "${cyan}======================================${off}"
echo -e "${green}"
read -p "     Pilih Nomor [1-3 / x] :  " port
echo -e "${off}"

case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-tr
;;
x) exit ;;
*) echo -e "" ; echo "Salah tekan ." ; sleep 1 ; port-change ;;
esac
