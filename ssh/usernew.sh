#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
clear
# Getting

sldomain=$(cat /root/nsdomain)
cdndomain=$(cat /root/awscdndomain)
slkey=$(cat /etc/slowdns/server.pub)
clear

cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`
#     Create account 
        hijau="\e[1;32m"
        NC="\033m"
        #Color validation 
          hijau="\e[1;32m"
          cyan="\e[1;36m"
          kuning="\e[1;33m"
          ungu="\e[1;35m"
          putih="\e[1;37m"
          white="\e[1;37m"
          NC="\033[0m"
          # CREATE S S H 
green_background="\033[42;37m"
red_background="\033[41;37m"
clear
echo -e "     ${red_background}Create Account${NC}"
echo -e "${hijau}"
read -p "        Username : " Login
read -p "        Password : " Pass
read -p "        Expired  : " masaaktif
IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`

clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`
clear
if [[ ! -z "${PID}" ]]; then
echo -e "\e[1;36m__________________________________________\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m        𝗔𝗖𝗖𝗢𝗨𝗡𝗧            \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[1;36m__________________________________________\033[0m" | tee -a /etc/log-create-user.log
echo -e "Username    : $Login" | tee -a /etc/log-create-user.log
echo -e "Password    : $Pass" | tee -a /etc/log-create-user.log
echo -e "Expired On  : $exp" | tee -a /etc/log-create-user.log
echo -e "\e[1;36m__________________________________________\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m          𝗦𝗘𝗥𝗩𝗘𝗥            \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[1;36m__________________________________________033[0m" | tee -a /etc/log-create-user.log
echo -e "Host        : $domen" | tee -a /etc/log-create-user.log
echo -e "PubKey      : $slkey" | tee -a /etc/log-create-user.log
echo -e "Nameserver  : $sldomain" | tee -a /etc/log-create-user.log
echo -e "SSHWS       : $portsshws" | tee -a /etc/log-create-user.log
echo -e "WS+SSL      : $wsssl" | tee -a /etc/log-create-user.log
echo -e "SSL/TLS     : $ssl" | tee -a /etc/log-create-user.log
echo -e "UDPGW       : 7200 - support VC" | tee -a /etc/log-create-user.log
echo -e "SSH-UDP     : 1-65535" | tee -a /etc/log-create-user.log
echo -e "_________________________________________________" | tee -a /etc/log-create-user.log
#echo -e "OpenVPN Config : http://$IP:81/" | tee -a /etc/log-create-user.log
echo -e "             ${red_background}TUTOR BUAT CONFIG${NC}"
echo -e "_________________________________________________" | tee -a /etc/log-create-user.log
echo -e "${hijau}contoh mode websocket port 80${NC}"
echo -e "_________________________________________________"
echo -e "masukan_bug:80@$Login:$Pass"
echo -e "PAYLOAD : pake payload websocket"
echo -e "_________________________________________________"
echo -e "${hijau}contoh mode ws & ssl port 443${NC}"
echo -e "_________________________________________________"
echo -e "$domen:443@Login:$Pass"
echo -e "PAYLOAD   : pake payload ws & ssl"
echo -e "SNI / SSL : Masukan_bug
echo -e___________________________________________________"
echo -e "Payload ws ssl port 443" | tee -a /etc/log-create-user.log
echo -e "
GET-CFRAY wss://[host] [protocol][crlf]Host: ${domen}
[crlf]Upgrade: ws[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Payload Websocket port 80" | tee -a /etc/log-create-user.log
echo -e "
GET / HTTP/1.1[crlf]Host: 
$domen[crlf]Upgrade: ws[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a /etc/log-create-user.log
echo -e "                  ${cyan}ILHAM-STORE${NC}"
echo -e "enter back to menu  "
else 

echo -e "${cyan}___________________________________${NC}"
echo -e "           ${red_background}ACCOUNT${NC}" | tee -a /etc/log-create-user.log
echo -e "${cyan}___________________________________${NC}" | tee -a /etc/log-create-user.log
echo -e "Username   : $Login" | tee -a /etc/log-create-user.log
echo -e "Password   : $Pass" | tee -a /etc/log-create-user.log
echo -e "Expired On : $exp" | tee -a /etc/log-create-user.log
echo -e "${cyan}___________________________________${NC}" | tee -a /etc/log-create-user.log
echo -e "           ${red_background}DETAIL${NC}" | tee -a /etc/log-create-user.log
echo -e "${cyan}___________________________________${NC}" | tee -a /etc/log-create-user.log
echo -e "Host     : $domen" | tee -a /etc/log-create-user.log
echo -e "NS       : $sldomain" | tee -a /etc/log-create-user.log
echo -e "PubKey   : $slkey" | tee -a /etc/log-create-user.log
echo -e "Port ws  : 80" | tee -a /etc/log-create-user.log
echo -e "ws ssl   : 443" | tee -a /etc/log-create-user.log
echo -e "SSL only : 447 , 777" | tee -a /etc/log-create-user.log
echo -e "SlowDNS  : 53,5300,443" 
echo -e "UDPGW    : 7200 = suport vc" | tee -a /etc/log-create-user.log
echo -e "${ungu}__________________________________________${NC}" | tee -a /etc/log-create-user.log
echo -e "${hijau}contoh mode udp${NC}" 
echo -e "${ungu}__________________________________________${NC}" | tee -a /etc/log-create-user.log
echo -e "SETING-UDP  : $domen:1-65535@$Login:$Pass" | tee -a /etc/log-create-user.log
echo -e "UDP CUSTOM  : centang ✓"
echo -e "${ungu}__________________________________________${Nc}" | tee -a /etc/log-create-user.log
#echo -e "OpenVPN Config : http://$IP:81/" | tee -a /etc/log-create-user.log
echo -e "${kuning}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}" | tee -a /etc/log-create-user.log
echo -e "Payload Websocket ( port 80 )" | tee -a /etc/log-create-user.log
echo -e "
GET / HTTP/1.1[crlf]Host:
$domen[crlf]Upgrade: ws[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "${kuning}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}" | tee -a /etc/log-create-user.log
echo -e "payload ws ssl ( port 443 )"
echo -e "
GET-CFRAY wss://[host] HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: ws[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "${kuning}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}" | tee -a /etc/log-create-user.log
echo -e "payload opok Telkomsel"
echo -e "
GET http://tsel.me/worryfree/ HTTP/1.1[crlf]Host: 
$domen[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "${kuning}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}" | tee -a /etc/log-create-user.log
fi
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "ILHAM - STORE"
menu
