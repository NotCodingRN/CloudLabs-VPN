CloudLabs-VPN for Linux
=======================

1. Open a terminal in this folder and run:   sh install.sh
2. Sign in with the username and password you were given:   cloudlabs-vpn login
3. Connect:
     cloudlabs-vpn connect           full VPN, all traffic (needs sudo)
     cloudlabs-vpn connect --proxy   no sudo needed (lab PCs): browser and terminal use a local proxy
4. cloudlabs-vpn status       shows your usage and limit
   cloudlabs-vpn disconnect   turns it off

To remove it:   sh uninstall.sh
Needs a 64-bit Intel/AMD PC and python3. sing-box is GPL-3.0 software: https://github.com/SagerNet/sing-box
