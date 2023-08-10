#!/bin/sh

pkgs=$(sudo find $HOME -iname novapkgs.txt)

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

if command_exists paru; then
    echo "Skipping Paru"
else
    echo "Installing Paru"
    sudo chown $USER /etc
    cd /etc
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
fi

echo "Installing Packages"
sudo pacman -Syyu --noconfirm
paru -S --needed --noconfirm - < $pkgs
sudo systemctl enable ly
