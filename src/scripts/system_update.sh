#!/bin/bash

# system_update.sh - Updates the system and installs base tools

color_echo "yellow" "Updating package repositories..."
dnf update -y

# System Config
# Optimize DNF package manager for faster downloads and efficient updates
color_echo "yellow" "Configuring DNF Package Manager..."
backup_file "/etc/dnf/dnf.conf"
echo "max_parallel_downloads=10" | tee -a /etc/dnf/dnf.conf > /dev/null
dnf -y install dnf-plugins-core

color_echo "yellow" "Installing essential tools..."
dnf install -y curl wget git vim nano unzip htop

# System Config
# Replace Fedora Flatpak Repo with Flathub for better package management and apps stability
color_echo "yellow" "Replacing Fedora Flatpak Repo with Flathub..."
dnf install -y flatpak
flatpak remote-delete fedora --force || true
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak repair
flatpak update

# Optional: Update Flatpak apps if Flatpak is installed
if command -v flatpak &>/dev/null; then
  color_echo "yellow" "Updating Flatpak apps..."
  flatpak update -y
fi

color_echo "green" "System update and essential tools installation complete."
