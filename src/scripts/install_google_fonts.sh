#!/bin/bash

# install_google_fonts.sh - Installs the full Google Fonts collection

set -e

color_echo() {
  local color=$1
  local message=$2
  case $color in
    "red") echo -e "\033[0;31m$message\033[0m" ;;
    "green") echo -e "\033[0;32m$message\033[0m" ;;
    "yellow") echo -e "\033[1;33m$message\033[0m" ;;
    *) echo "$message" ;;
  esac
}

ACTUAL_HOME="${SUDO_USER:+/home/$SUDO_USER}"
ACTUAL_HOME="${ACTUAL_HOME:-$HOME}"

color_echo "yellow" "Installing Google Fonts..."

wget -O /tmp/google-fonts.zip https://github.com/google/fonts/archive/main.zip
mkdir -p "$ACTUAL_HOME/.local/share/fonts/google"
unzip -q /tmp/google-fonts.zip -d "$ACTUAL_HOME/.local/share/fonts/google"
rm -f /tmp/google-fonts.zip

fc-cache -fv > /dev/null

color_echo "green" "Google Fonts installed successfully."
