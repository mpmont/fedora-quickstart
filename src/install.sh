#!/bin/bash

# install.sh - Main setup script for Fedora-based systems
# Author: [your name]
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

# Run individual setup steps
echo "➡ Updating system packages..."
bash "$SCRIPTS_DIR/system_update.sh"

# Future steps:
# bash "$SCRIPTS_DIR/install_packages.sh"
# bash "$SCRIPTS_DIR/install_flatpaks.sh"
# bash "$SCRIPTS_DIR/configure_shell.sh"

echo "✅ Initial setup completed!"
