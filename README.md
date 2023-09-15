### INSTALL SCRIPT
***ROOT*** 
 ```  
 sudo su 
 ``` 
 ***TAHAP 1*** 
 ``` 
 apt-get update && apt-get upgrade -y && update-grub && sleep 2 && apt install curl -y && apt install wget -y && apt install screen -y && ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && reboot 
 ``` 
 ***TAHAP 2*** 
 ``` 
 wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/IlhamStoree/v4/main/setup.sh" && chmod +x /usr/bin/setup.sh
 ```

