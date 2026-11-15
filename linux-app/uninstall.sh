#!/bin/sh
# Removes CloudLabs-VPN and your saved sign-in.
dest="${XDG_DATA_HOME:-$HOME/.local/share}/cloudlabs-vpn"
[ -x "$dest/cloudlabs-vpn" ] && "$dest/cloudlabs-vpn" logout >/dev/null 2>&1
rm -rf "$dest" "${XDG_CONFIG_HOME:-$HOME/.config}/cloudlabs-vpn" "$HOME/.local/bin/cloudlabs-vpn" "${XDG_DATA_HOME:-$HOME/.local/share}/applications/cloudlabs-vpn.desktop"
echo "CloudLabs-VPN is removed."
