#!/bin/sh
# Installs CloudLabs-VPN for the current user. No admin rights needed.
set -e
cd "$(dirname "$0")"
command -v python3 >/dev/null || { echo "CloudLabs-VPN needs python3. Install it first (e.g. sudo apt install python3)."; exit 1; }
[ "$(uname -m)" = x86_64 ] || { echo "This build is for 64-bit Intel/AMD PCs (x86_64); this one is $(uname -m)."; exit 1; }
dest="${XDG_DATA_HOME:-$HOME/.local/share}/cloudlabs-vpn"
apps="${XDG_DATA_HOME:-$HOME/.local/share}/applications"
mkdir -p "$dest" "$HOME/.local/bin" "$apps"
cp app/cloudlabs-vpn app/cloudlabs-vpn.svg app/sing-box app/libcronet.so app/LICENSE app/api.json "$dest/"
chmod 755 "$dest/cloudlabs-vpn" "$dest/sing-box"
chmod 644 "$dest/api.json" "$dest/libcronet.so" "$dest/LICENSE" "$dest/cloudlabs-vpn.svg"
ln -sf "$dest/cloudlabs-vpn" "$HOME/.local/bin/cloudlabs-vpn"
cat > "$apps/cloudlabs-vpn.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=CloudLabs-VPN
Comment=VPN for Cloud Computing labs
Exec="$dest/cloudlabs-vpn" gui
Icon=$dest/cloudlabs-vpn.svg
Terminal=false
Categories=Network;
DESKTOP
chmod 644 "$apps/cloudlabs-vpn.desktop"
command -v update-desktop-database >/dev/null && update-desktop-database "$apps" 2>/dev/null || true
echo "CloudLabs-VPN is installed. Open it from your apps menu (search CloudLabs), or run:  cloudlabs-vpn gui"
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) echo "(For the cloudlabs-vpn command, open a new terminal first.)";; esac
