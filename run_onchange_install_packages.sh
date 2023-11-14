#!/bin/bash

# Nerdfont
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf

## NeoVim
pacman -S neovim

## Lunarvim
LV_BRANCH='release-1.3/neovim-0.9' curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh | bash -
