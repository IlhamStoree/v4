#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading Update File"
# hapus data
rm -rf set-br
rm -rf menu-bckp
rm -rf menu-backup
rm -rf backup
rm -rf restore
# mendowload ulang

wget https://raw.githubusercontent.com/Bringas-tunnel/v4/main/backup/set-br.sh &&  chmod +x set-br.sh && ./set-br.sh
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/Bringas-tunnel/v4/main/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/Bringas-tunnel/v4/main/backup/menu-backup.sh" && chmod +x /usr/bin/menu-backup
wget -q -O /usr/bin/backup "https://raw.githubusercontent.com/Bringas-tunnel/v4/main/backup/backup.sh" && chmod +x /usr/bin/backup
wget -q -O /usr/bin/restore "https://raw.githubusercontent.com/Bringas-tunnel/v4/main/backup/restore.sh" && chmod +x /usr/bin/restore
echo -e " [INFO] Update Successfully"
sleep 2
exit
