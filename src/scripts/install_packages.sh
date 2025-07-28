#!/bin/bash

# install_packages.sh - Installs selected DNF packages (apps and CLI tools)

PACKAGES=(
  alacritty
  btop
  cmake
  cmatrix
  docker-ce
  docker-ce-cli
  docker-compose-plugin
  fastfetch
  fish
  gcc
  gcc-c++
  genisoimage
  git
  gnome-boxes
  htop
  httpd
  inotify-tools
  make
  mpv
  mysql-workbench-community
  nginx-filesystem
  nodejs
  obs-studio
  php
  php-fpm
  python3.12
  solaar
  tldr
  tlp
  vlc
  yt-dlp
)

echo "📦 Installing selected DNF packages..."

for pkg in "${PACKAGES[@]}"; do
  if ! rpm -q "$pkg" > /dev/null 2>&1; then
    echo "➕ Installing $pkg..."
    dnf install -y "$pkg"
  else
    echo "✔️ $pkg is already installed. Skipping."
  fi
done

echo "✅ DNF package installation complete."
