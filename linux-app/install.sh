#!/bin/sh
# Installs CloudLabs-VPN for the current user. No admin rights needed.
set -e
cd "$(dirname "$0")"
command -v python3 >/dev/null || { echo "CloudLabs-VPN needs python3. Install it first (e.g. sudo apt install python3)."; exit 1; }
[ "$(uname -m)" = x86_64 ] || { echo "This build is for 64-bit Intel/AMD PCs (x86_64); this one is $(uname -m)."; exit 1; }
dest="${XDG_DATA_HOME:-$HOME/.local/share}/cloudlabs-vpn"
mkdir -p "$dest" "$HOME/.local/bin"
cp app/cloudlabs-vpn app/sing-box app/libcronet.so app/LICENSE app/api.json "$dest/"
chmod 755 "$dest/cloudlabs-vpn" "$dest/sing-box"
ln -sf "$dest/cloudlabs-vpn" "$HOME/.local/bin/cloudlabs-vpn"
echo "CloudLabs-VPN is installed."
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) echo "Open a new terminal first (or run: export PATH=\"\$HOME/.local/bin:\$PATH\")";; esac
echo "Then sign in:  cloudlabs-vpn login"
