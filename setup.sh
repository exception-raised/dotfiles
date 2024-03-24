#!/bin/bash

echo -e  "Starting auto Arch setup...\n"

echo -e "Attempting to install packages...>
sudo pacman -Syu --no-confirm \
        alacritty \
        picom   \
        fish    \
        i3-wm   \
        neofetch \
        polybar  \
        nano    \
        rofi    \
        nerd-fonts \

echo -e "Successfully installed packages..>

echo -e "Copying config files...\n"

cp -R alacritty ~/.config/
cp -R dconf ~/.config/
cp -R eww ~/.config/
cp -R fish ~/.config/
cp -R i3 ~/.config
cp -R neofetch ~/.config
cp -R picom ~/.config
cp -R polybar ~/.config
cp -R pulse ~/.config
cp -R rofi ~/.config
