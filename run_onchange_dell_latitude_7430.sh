#!/bin/bash

git clone --depth=1 https://github.com/stefanpartheym/archlinux-ipu6-webcam ipu6
cd ipu6 && ./install.sh
rm -rf ipu6

pacman -Sy --needed --noconfirm laptop-mode-tools
