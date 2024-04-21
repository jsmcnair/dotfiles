#!/bin/bash

# Locale
LOCALE="en_GB.UTF-8"
sudo sed -i -E "s|^#($LOCALE)|\1|" /etc/locale.gen
sudo locale-gen
echo "LANG=$LOCALE" | sudo tee /etc/locale.conf > /dev/null

# Timezone
TIMEZONE="Europe/London"
sudo ln -sf "/usr/share/zoneinfo/$TIMEZONE" /etc/localtime

# Keyboard layout
KEYS="uk"
sudo loadkeys $KEYS
echo "KEYMAP=$KEYS" | sudo tee /etc/vconsole.conf > /dev/null

# Basics
sudo pacman -S --noconfirm --needed \
  zsh git github-cli otf-droid-nerd bitwarden-cli neovim \
  firefox firefox-i18n-en-gb man-db starship base-devel \
  htop tailscale


## Enable tailscaled
sudo systemctl enable --now tailscaled

## Lunarvim
sudo pacman -S --noconfirm --needed make gcc python python-pip npm rustup
[[ ! -e ~/.local/bin/lvim ]] && LV_BRANCH='release-1.3/neovim-0.9' curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh | bash -

# SSH
if [[ ! -e ~/.ssh/id_ed25519 ]]; then
  echo ""
  echo "SSH key does not exist, creating..."
  echo ""
  ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519
fi

# Bitwarden Login
if [[ ! -e ~/.config/Bitwarden\ CLI/data.json ]]; then
  echo ""
  echo "Running bitwarden login..."
  echo ""
  export BW_SESSION=$(bw login --raw)
fi

# Github Login

# Desktop
if [[ ! -e ~/.config/hypr/hyprland.conf ]]; then
  git clone https://github.com/jsmcnair/hyprdots ~/Hyprdots
  cd ~/Hyprdots/Scripts
  ./install.sh
fi
