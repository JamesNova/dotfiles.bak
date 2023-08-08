#!/bin/sh

pkgs=$(sudo find $HOME -iname novapkgs.txt)

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

if command_exists paru; then

elif
    cd /etc
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
fi


paru -Syyu
paru -S --needed --noconfirm - < $pkgs
