#!/bin/sh
set -e
cd "$(dirname "$0")/sxfire"
sudo pacman -S --needed curl jq xdg-utils firefox
mkdir -p ~/.local/bin ~/.local/share/applications ~/.local/share/sxfire/profile/chrome
cp sxfire sxfire-open ~/.local/bin/
chmod +x ~/.local/bin/sxfire ~/.local/bin/sxfire-open
cp firesx/firesx ~/.local/bin/
chmod +x ~/.local/bin/firesx
cp firesx/profile/user.js ~/.local/share/sxfire/profile/
cp firesx/profile/chrome/userChrome.css ~/.local/share/sxfire/profile/chrome/
cat > ~/.local/share/applications/sxfire-open.desktop <<EOF
[Desktop Entry]
Type=Application
Name=sxfire link opener
Exec=$HOME/.local/bin/sxfire-open %u
MimeType=x-scheme-handler/sxfire;
NoDisplay=true
EOF
xdg-mime default sxfire-open.desktop x-scheme-handler/sxfire
echo "Done. Try: sxfire hello world"
echo "You can also open a link directly without searching with the FireSX command."
echo "Example: firesx wiki.artixlinux.org will open the Artix Wiki in a SXFire Firefox profile."
