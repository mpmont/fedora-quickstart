# 🐧 Fedora Quickstart

This repository automates the post-installation setup of a Fedora system. It is particularly useful for quickly configuring a new development environment or restoring your personal setup.

> 🔧 This project is a work in progress. More scripts, dotfiles and shell configurations will be added soon.

---

## 📁 Project Structure

```
fedora-quickstart/
├── dotfiles/                      # (planned) Personal config files: .bashrc, .gitconfig, etc.
├── install.sh                     # Main setup entry point (must be run with sudo)
└── scripts/
    ├── install_flatpaks.sh        # Installs user-selected Flatpak applications
    ├── install_packages.sh        # Installs essential system packages via DNF
    └── system_update.sh           # Updates system and installs basic CLI tools
```

---

## 🚀 Usage

```bash
git clone https://github.com/your-username/fedora-quickstart.git
cd fedora-quickstart

chmod +x install.sh scripts/*.sh
sudo ./install.sh
```

---

## 🔧 What Each Script Does

### ✅ `install.sh`

- Must be run with `sudo`
- Performs:
  1. System update
  2. (Prompt) Installation of Flatpak apps
  3. (Always) Installation of essential DNF packages

---

### ✅ `scripts/system_update.sh`

Updates the system and installs core command-line tools:

```bash
curl
wget
git
vim
nano
unzip
htop
neofetch
```

---

### ✅ `scripts/install_flatpaks.sh`

Installs a curated list of Flatpak applications from Flathub:

```bash
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
```

---

### ✅ `scripts/install_packages.sh`

Installs key Fedora packages via DNF, including CLI tools and graphical apps:

```bash
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
```

---

## 🧩 Upcoming Additions

- `configure_shell.sh` (custom aliases, PS1, shell options)
- `dotfiles/` with `.bashrc`, `.gitconfig`, `.vimrc`, etc.
- Modular environment setup scripts (Node.js, Python, PHP, etc.)
- Snap package support
- Setup logging (`setup.log`)

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
