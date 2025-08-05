#!/bin/bash

# install.sh - Main setup script for Fedora-based systems
# Author: Marco Monteiro
# Version: 1.0

# Ensure the script is run as root
if [[ "$EUID" -ne 0 ]]; then
  echo_color "red" "Please run this script with sudo or as root."
  exit 1
fi

# Set base and scripts directory
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTS_DIR="$BASE_DIR/scripts"

echo_color "green" " Starting Fedora setup automation"

# Run system update
echo_color "yellow" "Updating system packages..."
bash "$SCRIPTS_DIR/system_update.sh"

# Ask if user wants to install Flatpak apps
echo ""
echo_color "yellow" " The following Flatpak apps can be installed:"
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
  echo_color "yellow" "Installing Flatpak applications..."
  bash "$SCRIPTS_DIR/install_flatpaks.sh"
else
  echo_color "green" "Skipping Flatpak application installation."
fi

# Install DNF packages (mandatory)
echo ""
echo_color "yellow" "The following DNF packages will now be installed:"
cat <<EOF
  - alacritty
  - btop
  - cmake
  - cmatrix
  - docker-ce
  - docker-ce-cli
  - docker-compose-plugin
  - fastfetch
  - fish
  - gcc
  - gcc-c++
  - genisoimage
  - git
  - gnome-boxes
  - htop
  - httpd
  - inotify-tools
  - make
  - mpv
  - mysql-workbench-community
  - nginx-filesystem
  - nodejs
  - obs-studio
  - php
  - php-fpm
  - python3.12
  - solaar
  - tldr
  - tlp
  - vlc
  - yt-dlp
EOF

echo "🔧 Installing DNF packages..."
bash "$SCRIPTS_DIR/install_packages.sh"

# Ask if user wants to install Hardware Accelerated Codecs for AMD GPUs. This improves video playback and encoding performance on systems with AMD graphics.
echo ""

read -rp "Install Hardware Accelerated Codecs for AMD GPUs. This improves video playback and encoding performance on systems with AMD graphics? (y/n): " INSTALL_CODECS

if [[ "$INSTALL_CODECS" =~ ^[Yy]$ ]]; then
  color_echo "yellow" "Installing AMD Hardware Accelerated Codecs..."
  bash "$SCRIPTS_DIR/install_codecs.sh"
else
  echo "⏭️ Skipping Install Hardware Accelerated Codecs installation."
fi

# Ask if user wants to install Microsoft Fonts
echo ""
echo "🖋️ You can optionally install Microsoft Core Fonts (Arial, Times New Roman, etc.)"
read -rp "➡ Do you want to install Microsoft Fonts? (y/n): " INSTALL_FONTS

if [[ "$INSTALL_FONTS" =~ ^[Yy]$ ]]; then
  echo "🔧 Installing Microsoft Fonts..."
  bash "$SCRIPTS_DIR/install_microsoft_fonts.sh"
else
  echo "⏭️ Skipping Microsoft Fonts installation."
fi

# Ask if user wants to install Google Fonts
echo ""
echo "🔤 You can optionally install the full Google Fonts collection (~600MB)"
read -rp "➡ Do you want to install Google Fonts? (y/n): " INSTALL_GOOGLE_FONTS

if [[ "$INSTALL_GOOGLE_FONTS" =~ ^[Yy]$ ]]; then
  echo "🔧 Installing Google Fonts..."
  bash "$SCRIPTS_DIR/install_google_fonts.sh"
else
  echo "⏭️ Skipping Google Fonts installation."
fi

# Ask if user wants to install Adobe Fonts
echo ""
echo "🅰️ You can optionally install Adobe's open source fonts (Source Sans, Serif, Code Pro)"
read -rp "➡ Do you want to install Adobe Fonts? (y/n): " INSTALL_ADOBE_FONTS

if [[ "$INSTALL_ADOBE_FONTS" =~ ^[Yy]$ ]]; then
  echo "🔧 Installing Adobe Fonts..."
  bash "$SCRIPTS_DIR/install_adobe_fonts.sh"
else
  echo "⏭️ Skipping Adobe Fonts installation."
fi


echo ""
echo "✅ Initial setup completed!"
