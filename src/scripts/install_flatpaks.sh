#!/bin/bash

# install_flatpaks.sh - Installs user applications from Flathub via Flatpak

echo "📦 Setting up Flathub repository..."

# Add Flathub if not already added
if ! flatpak remote-list | grep -q flathub; then
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  echo "✅ Flathub added."
else
  echo "ℹ️ Flathub already configured."
fi

echo "⬇️ Installing Flatpak applications..."

FLATPAK_APPS=(
  com.anydesk.Anydesk
  com.brave.Browser
  com.getpostman.Postman
  com.gitbutler.gitbutler
  com.slack.Slack
  com.spotify.Client
  com.stremio.Stremio
  com.transmissionbt.Transmission
  com.valvesoftware.Steam
  it.mijorus.gearlever
  org.kde.kdenlive
  org.onlyoffice.desktopeditors
  org.signal.Signal
)

for app in "${FLATPAK_APPS[@]}"; do
  if flatpak info "$app" &>/dev/null; then
    echo "✔️ $app is already installed. Skipping."
  else
    echo "➕ Installing $app..."
    flatpak install -y flathub "$app"
  fi
done

echo "✅ Flatpak application installation complete."
