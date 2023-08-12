#!/bin/sh
set -e

read -p "Are you using Arch Linux? (or a distro that uses pacman?) [y/N]" distro

case $distro in
    y|Y|yes|Yes|YES)
        folder=$(sudo find / -iname novapkgs.txt -printf '%h')
        sudo chown $USER $folder
        cd $folder
        ./installdeps.sh
    ;;
    *)
        read -p "Did you already installed the dependencies? [y/N]" deps
        case $deps in
            y|Y|yes|Yes|YES)
                echo "Good. Proceeding with build..."
            ;;
            *)
                echo "You need to install the dependencies listed in ./build/novapkgs.txt before running this script."
                exit 1
            ;;
        esac
    ;;
esac
        
cd $HOME
echo "Cloning novadots repo"
git clone https://github.com/JamesNova/dotfiles $HOME/novadots

echo "Building the novadots will change your personal configs"
read -p "Do you want to make backup of your dotfiles? [Y/n]" backup

if [[ -f "$HOME/.xinitrc" ]]; then
    mv .xinitrc .xinitrc.bak
fi

if [[ -f "$HOME/.bashrc" ]]; then
    mv .bashrc .bashrc.bak
fi

if [[ -d "$HOME/.config" ]]; then
    mv .config .config.bak
fi

if [[ -f "$HOME/.mpd" ]]; then
    mv .mpd .mpd.bak
fi

if [[ ! -d "$HOME/.local/bin" ]]; then
    mkdir -p $HOME/.local/bin
fi

mv novadots/.xinitrc .xinitrc
mv novadots/.bashrc .bashrc
mv novadots/.mpd .mpd
mv novadots/Music Music
mv novadots/.config .config
mv novadots/.local/bin/* .local/bin/
mv novadots/.session .session
touch $HOME/.theme
echo "theme=Nord" > $HOME/.theme

case $backup in
    n|N|no|No|NO)
        rm -rf .xinitrc.bak
        rm -rf .bashrc.bak
        rm -rf .config.bak
        rm -rf .mpd.bak
    ;;
    *)
    ;;
esac

source $HOME/.theme
$HOME/.local/bin/exportlocal
$HOME/.local/bin/alathemer
$HOME/.local/bin/awmthemer
$HOME/.local/bin/rofithemer
$HOME/.local/bin/polythemer

echo "Cleaning things out..."
repocp=$(dirname $(sudo find / -iname novapkgs.txt -printf '%h'))
rm -rf $repocp
rm -rf $HOME/novadots

echo "Now you need to do the final step manually"
echo "Download and extract the next zip file as /usr/share/backgrounds"
echo "https://drive.google.com/file/d/1xk_i1mXldCwbXCiOLeBVW3kM70PsekuK/view?usp=sharing"
