#!/bin/bash
#Script By Mardhex
clear
echo -e ""
echo -e "Download all cert v2ray......" | lolcat
echo -e ""
sleep 6
echo -e ""
clear
echo -e "SUCCES √" | lolcat
echo -e ""
echo -e "wait for me..............." | lolcat
sleep 3
clear
mkdir -p /etc/v2ray
read -p "Masukan Domain Anda :  " domain
if [[ ${domain} ]]; then
echo $domain >/etc/v2ray/domain
else
echo -e "Please input your Domain"
echo -e ""
echo -e "Start again in 5 seconds"
echo -e ""
sleep 5     
exit 1
fi

#Auto Update
apt update -y
apt install sudo -y
sudo apt-get clean all
sudo apt-get autoremove -y
apt install -y debconf-utils
sudo apt-get remove --purge exim4 -y
sudo apt-get remove --purge ufw firewalld -y
apt install -y --no-install-recommends software-properties-common
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
apt install -y speedtest-cli jq iptables iptables-persistent netfilter-persistent net-tools socat cron dropbear squid neofetch

#Install Certificate
cd
mkdir /root/.acme.sh
systemctl stop nginx
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc

echo ""
sleep 0,5
clear
