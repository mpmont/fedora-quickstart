#!/bin/bash

# install_sublime_text.sh - Installs Sublime Text and configures themes and plugins

echo "📝 Installing Sublime Text..."

# Check if run as root
if [[ "$EUID" -ne 0 ]]; then
  echo "❌ Please run this script with sudo or as root."
  exit 1
fi

# Check if already installed
if rpm -q sublime-text &> /dev/null; then
  echo "✔️ Sublime Text is already installed. Skipping package installation."
else
  # Import GPG key
  echo "🔑 Importing Sublime Text GPG key..."
  rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg

  # Add repo only if not already present
  REPO_FILE="/etc/yum.repos.d/sublime-text.repo"
  if [[ ! -f "$REPO_FILE" ]]; then
    echo "➕ Adding Sublime Text repository..."
    dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
  else
    echo "ℹ️ Sublime Text repository already exists."
  fi

  # Install Sublime Text
  echo "📦 Installing package..."
  dnf install -y sublime-text
fi

# Define Sublime config directories
SUBLIME_DIR="$HOME/.config/sublime-text"
PACKAGES_USER_DIR="$SUBLIME_DIR/Packages/User"
mkdir -p "$PACKAGES_USER_DIR"

# Copy user preferences
echo "🎨 Copying Preferences.sublime-settings..."
cp settings/Preferences.sublime-settings "$PACKAGES_USER_DIR/Preferences.sublime-settings"

# Copy LSP settings
echo "🔧 Copying LSP.sublime-settings..."
mkdir -p "$PACKAGES_USER_DIR/LSP"
cp settings/LSP.sublime-settings "$PACKAGES_USER_DIR/LSP/LSP.sublime-settings"

# Copy phpfmt settings
echo "🔧 Copying phpfmt.sublime-settings..."
cp settings/phpfmt.sublime-settings "$PACKAGES_USER_DIR/phpfmt.sublime-settings"

# Copy Package Control settings with plugins to install
echo "📦 Defining plugins to install via Package Control..."
cat > "$PACKAGES_USER_DIR/Package Control.sublime-settings" <<EOF
{
  "installed_packages":
  [
    "Package Control",
    "A File Icon",
    "Dracula Color Scheme",
    "GitGutter",
    "SublimeLinter",
    "Tabnine",
    "Color Highlight",
    "LSP",
    "LSP-typescript",
    "MarkdownPreview",
    "AutoFileName",
    "Emmet",
    "SideBarEnhancements",
    "Material Theme",
    "phpfmt"
  ]
}
EOF

# Trigger Sublime once to install packages
echo "🚀 Launching Sublime Text to trigger plugin installation..."
subl & sleep 5 && pkill subl

echo "✅ Sublime Text setup complete with theme, plugins, LSP and phpfmt configuration."
