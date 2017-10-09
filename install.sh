#!/bin/sh

cd /tmp
wget https://raw.githubusercontent.com/thermatk/VPN-Failsafe-NetworkManager/master/90_vpn_failsafe
wget https://raw.githubusercontent.com/thermatk/VPN-Failsafe-NetworkManager/master/disableFW.desktop
rm -f /etc/NetworkManager/dispatcher.d/90_vpn_failsafe
cp 90_vpn_failsafe /etc/NetworkManager/dispatcher.d
chmod 700 /etc/NetworkManager/dispatcher.d/90_vpn_failsafe
chown root:root /etc/NetworkManager/dispatcher.d/90_vpn_failsafe

chmod +x disableFW.desktop
rm -f /usr/share/applications/disableFW.desktop
cp disableFW.desktop /usr/share/applications
