#!/bin/bash

# install_adobe_fonts.sh - Installs Adobe's open source font collection

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

color_echo "yellow" "Installing Adobe Fonts..."

mkdir -p "$ACTUAL_HOME/.local/share/fonts/adobe-fonts"

git clone --depth 1 https://github.com/adobe-fonts/source-sans.git \
  "$ACTUAL_HOME/.local/share/fonts/adobe-fonts/source-sans"

git clone --depth 1 https://github.com/adobe-fonts/source-serif.git \
  "$ACTUAL_HOME/.local/share/fonts/adobe-fonts/source-serif"

git clone --depth 1 https://github.com/adobe-fonts/source-code-pro.git \
  "$ACTUAL_HOME/.local/share/fonts/adobe-fonts/source-code-pro"

fc-cache -f > /dev/null

color_echo "green" "Adobe Fonts installed successfully."
