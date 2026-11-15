CloudLabs-VPN for Linux
=======================

1. Open a terminal in this folder and run:   sh install.sh
2. Open CloudLabs-VPN from your apps menu (search "CloudLabs"). It opens in a browser window.
3. Sign in with the username and password you were given, then press the big button.
   - Full VPN: all traffic goes through it. Asks for your computer password.
   - Proxy: no admin rights needed (lab PCs). Your browser and terminal use a local proxy;
     the window shows the line to paste.

Prefer the terminal?
  cloudlabs-vpn login | connect | connect --proxy | status | disconnect | logout

To remove it:   sh uninstall.sh
Needs a 64-bit Intel/AMD PC and python3. sing-box is GPL-3.0 software: https://github.com/SagerNet/sing-box
