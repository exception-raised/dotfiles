#!/bin/bash

echo -e "Starting auto Arch setup...\n"
sudo pacman -Syu --noconfirm

echo -e "Attempting to install packages...\n"
sudo pacman -Syu --noconfirm \
        alacritty \
        picom   \
        fish    \
        i3-wm   \
        neofetch \
        polybar  \
        nano    \
        rofi    \
        nerd-fonts \
        xorg-server \
        xorg-xinit \
        lightdm \
        lightdm-gtk-greeter \
        chromium \
        npm \
        go \
        flameshot \
        docker    \
        docker-compose \
        qbittorrent \
        postgresql \
        mysql \
	feh

echo -e "Successfully installed packages...\n"

echo -e "Copying config files...\n"
cp -R alacritty ~/.config/
cp -R eww ~/.config/
cp -R fish ~/.config/
cp -R i3 ~/.config
cp -R neofetch ~/.config
cp -R picom ~/.config
cp -R polybar ~/.config
cp -R rofi ~/.config
cp -R Wallpapers ~/.config

### Setup yay
echo -e "Setting up yay...\n"

### Install required dependencies (Git and base-devel)
sudo pacman -Sy --noconfirm git base-devel

### Clone yay repository and build
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

read -n1 -p 'Would you like to install Rust? (y/n)' INST
if [[ $INST == "Y" || $INST == "y" ]]; then 
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    echo -e 'Installed Rust\n'
fi

echo -e "Installing AUR packages...\n"
yay -S --noconfirm \
    vscodium \
    obsidian-bin \
    anki \
    thunar \
    hoppscotch-app-bin \
    virt-manager \
    valentina-studio \
    lxappearance

### Enable LightDM Service
sudo systemctl enable lightdm

### Set fish as default shell
sudo chsh -s $(which fish) $USER

echo -e "Setup complete!\n"
