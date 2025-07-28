#!/bin/bash

# install.sh - Main setup script for Fedora-based systems
# Author: Marco Monteiro
# Version: 1.0

# Ensure the script is run as root
if [[ "$EUID" -ne 0 ]]; then
  echo "Please run this script with sudo or as root."
  exit 1
fi

# Set base and scripts directory
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS_DIR="$BASE_DIR/scripts"

echo "▶ Starting Fedora setup automation"

# Run system update
echo "➡ Updating system packages..."
bash "$SCRIPTS_DIR/system_update.sh"

# Ask if user wants to install Flatpak apps
echo ""
echo "📦 The following Flatpak apps can be installed:"
cat <<EOF
  - com.anydesk.Anydesk
  - com.brave.Browser
  - com.getpostman.Postman
  - com.gitbutler.gitbutler
  - com.slack.Slack
  - com.spotify.Client
  - com.stremio.Stremio
  - com.transmissionbt.Transmission
  - com.valvesoftware.Steam
  - it.mijorus.gearlever
  - org.kde.kdenlive
  - org.onlyoffice.desktopeditors
  - org.signal.Signal
EOF

read -rp "➡ Do you want to install these Flatpak apps? (y/n): " INSTALL_FLATPAKS

if [[ "$INSTALL_FLATPAKS" =~ ^[Yy]$ ]]; then
  echo "🔧 Installing Flatpak applications..."
  bash "$SCRIPTS_DIR/install_flatpaks.sh"
else
  echo "⏭️ Skipping Flatpak application installation."
fi

# Future steps:
# bash "$SCRIPTS_DIR/install_packages.sh"
# bash "$SCRIPTS_DIR/configure_shell.sh"

echo ""
echo "✅ Initial setup completed!"
