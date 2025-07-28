#!/bin/bash

# system_update.sh - Updates the system and installs base tools

echo "🔄 Updating package repositories..."
dnf update -y

echo "📦 Installing essential tools..."
dnf install -y curl wget git vim nano unzip htop neofetch

# Optional: Update Flatpak apps if Flatpak is installed
if command -v flatpak &>/dev/null; then
  echo "🔄 Updating Flatpak apps..."
  flatpak update -y
fi

echo "✅ System update and essential tools installation complete."
