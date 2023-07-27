#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip)
green_background="\033[42;37m"
NC="\033[0m"
red_background="\033[41;37m"
wh="\e[1;37m" # PUTIH
cy="\e[1;36m" # CYAN
ye="\e[1;33m" # KUNING
clear 
echo -e "${red_background}DOMAIN MENU${NC}"
echo -e ""
echo -e "        ${wh}[•1]${NC} ${cy}𝗚𝗮𝗻𝘁𝗶 𝗗𝗼𝗺𝗮𝗶𝗻 ${Nc}"
echo -e "        ${wh}[•2]${NC} ${cy}𝗥𝗲𝗻𝗲𝘄 𝗰𝗲𝗿𝘁 𝗱𝗼𝗺𝗮𝗶𝗻 ${NC}"
echo -e "        ${ye}[•0]${NC} ${ye}Back To Menu${NC}"
echo -e "${ye}"
read -p " >>>   " opt
echo -e ""
case $opt in
1) clear ; add-host ;;
2) clear ; certv2ray ;;
0) clear ; menu ;;
x) exit ;;
*) echo "salah pencet bro" ; sleep 1 ; menu-domain ;;
esac
