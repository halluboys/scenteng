#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Link Hosting Kalian Untuk Ssh Vpn
akbarvpn="raw.githubusercontent.com/halluboys/xxx/main/ssh"
# Link Hosting Kalian Untuk Sstp
#akbarvpnn="raw.githubusercontent.com/halluboys/xxx/main/sstp"
# Link Hosting Kalian Untuk Ssr
#akbarvpnnn="raw.githubusercontent.com/halluboys/xxx/main/ssr"
# Link Hosting Kalian Untuk Shadowsocks
#akbarvpnnnn="raw.githubusercontent.com/halluboys/xxx/main/shadowsocks"
# Link Hosting Kalian Untuk Wireguard
#akbarvpnnnnn="raw.githubusercontent.com/halluboys/xxx/main/wireguard"
# Link Hosting Kalian Untuk Xray
akbarvpnnnnnn="raw.githubusercontent.com/halluboys/xxx/main/xray"
# Link Hosting Kalian Untuk Ipsec
#akbarvpnnnnnnn="raw.githubusercontent.com/halluboys/xxx/main/ipsec"
# Link Hosting Kalian Untuk Backup
#akbarvpnnnnnnnn="raw.githubusercontent.com/halluboys/scenteng/main/backup"
# Link Hosting Kalian Untuk Websocket
akbarvpnnnnnnnnn="raw.githubusercontent.com/halluboys/xxx/main/websocket"
# Link Hosting Kalian Untuk Ohp
akbarvpnnnnnnnnnn="raw.githubusercontent.com/halluboys/xxx/main/ohp"

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);

rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/akbarstorevpn;
echo "IP=" >> /var/lib/akbarstorevpn/ipvps.conf
wget https://${akbarvpn}/cf.sh && chmod +x cf.sh && ./cf.sh
#install v2ray
wget https://${akbarvpnnnnnn}/ins-xray1.sh && chmod +x ins-xray1.sh && screen -S xray ./ins-xray1.sh
#install ssh ovpn
wget https://${akbarvpn}/ssh-vpn1.sh && chmod +x ssh-vpn1.sh && screen -S ssh-vpn ./ssh-vpn1.sh
#wget https://${akbarvpnn}/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
#install ssr
#wget https://${akbarvpnnn}/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
#wget https://${akbarvpnnnn}/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#installwg
#wget https://${akbarvpnnnnn}/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install L2TP
#wget https://${akbarvpnnnnnnn}/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
#wget https://${akbarvpnnnnnnnn}/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# Websocket
#wget https://${akbarvpnnnnnnnnn}/edu.sh && chmod +x edu.sh && ./edu.sh
# Ohp Server
#wget https://${akbarvpnnnnnnnnnn}/ohp.sh && chmod +x ohp.sh && ./ohp.sh

rm -f /root/ins.sh
#rm -f /root/sstp.sh
#rm -f /root/wg.sh
#rm -f /root/ss.sh
#rm -f /root/ssr.sh
rm -f /root/ins-xray1.sh
#rm -f /root/ipsec.sh
#rm -f /root/set-br.sh
#rm -f /root/edu.sh
#rm -f /root/ohp.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://t.me/haidaralkhawarizmi

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://${akbarvpn}/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
echo " "
echo "Installation has been completed!!"echo " "
echo "============================================================================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "----------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - Nginx                   : 89"  | tee -a log-install.txt
echo "   - XRAYS Vmess TLS         : 443"  | tee -a log-install.txt
echo "   - XRAYS Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Vless TLS         : 443"  | tee -a log-install.txt
echo "   - XRAYS Vless None TLS    : 80"  | tee -a log-install.txt
echo "   - XRAYS Trojan            : 2083"  | tee -a log-install.txt
echo "   - Websocket TLS           : 8443"  | tee -a log-install.txt
echo "   - Websocket None TLS      : 8880"  | tee -a log-install.txt
echo "   - Websocket Ovpn          : 2086"  | tee -a log-install.txt
echo "   - TrojanGo                : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo " Reboot 15 Sec"
sleep 15
rm -f setup.sh
reboot
