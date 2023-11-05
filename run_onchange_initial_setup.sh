#!/bin/bash

sudo pacman -S --noconfirm --needed \
  swayidle

sudo pacman -S --noconfirm --needed \
  zsh github-cli otf-droid-nerd bitwarden-cli neovim \
  firefox firefox-i18n-en-gb man-db

## Lunarvim
sudo pacman -S --noconfirm --needed make gcc python python-pip npm rustup
[[ ! -e ~/.local/bin/lvim ]] && LV_BRANCH='release-1.3/neovim-0.9' curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh | bash -

# Starship
curl -S https://starship.rs/install.sh | sudo sh

## SSH
[[ ! -e ~/.ssh/id_ed25519 ]] && ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519
