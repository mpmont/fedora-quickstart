#!/bin/bash

# install_microsoft_fonts.sh - Installs Microsoft Core Fonts on Fedora

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

color_echo "yellow" "Installing Microsoft Fonts (core)..."

dnf install -y curl cabextract xorg-x11-font-utils fontconfig

rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

color_echo "green" "Microsoft Fonts (core) installed successfully."
