# VPN-Failsafe-NetworkManager

Ensures that all traffic to/from the internet goes only through the VPN and doesn't leak even if the VPN disconnects. 

## Algorithm
A [dispatcher script](https://developer.gnome.org/NetworkManager/stable/NetworkManager.html) reacts to vpn-up and vpn-down events:
- **vpn-up**
  - Enable UFW and set it to allow only the traffic passing through the VPN interface
  - Also allow VPN remote's IPs from any interface, so that VPN can be reestablished easily
- **vpn-down**
  - Additionally enable all DNS traffic until VPN is back up, so that VPN can be reestablished easily in case the remote is a domain
  - *There may be DNS leaks on this stage, but everything else is still firewalled*
- When you're done with VPN activity, disable the firewall and access the internet normally either by
  - Using the provided "Disable Failsafe Firewall" app
  - Or executing `sudo ufw disable`

## Installation
`wget -q https://raw.githubusercontent.com/thermatk/VPN-Failsafe-NetworkManager/master/install.sh -O - | sudo bash`
