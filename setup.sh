#!/bin/bash

echo -e "Starting auto Arch setup...\n"
sudo pacman -Syu --noconfirm

echo -e "Attempting to install packages...\n"
sudo pacman -S --noconfirm \
    fish \
    neofetch \
    rofi \
    nerd-fonts \
    npm \
    go \
    docker \
    docker-compose \
    qbittorrent \
    postgresql \
    mysql \
    feh \
    php \
    lightdm \
    lightdm-gtk-greeter

echo -e "Successfully installed packages...\n"

echo -e "Copying config files...\n"
mkdir -p ~/.config
cp -R kitty fish hypr waybar hyprpaper wofi wlogout Wallpapers ~/.config

# Setup yay
echo -e "Setting up yay...\n"
sudo pacman -Sy --noconfirm git base-devel

if [ ! -d "yay" ]; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
fi

# Optional Rust installation
read -n1 -p 'Would you like to install Rust? (y/n) ' INST
echo
if [[ $INST == "Y" || $INST == "y" ]]; then 
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    echo -e 'Installed Rust\n'
fi

echo -e "Installing AUR packages...\n"
yay -S --noconfirm \
    obsidian-bin \
    anki \
    thunar \
    hoppscotch-app-bin \
    virt-manager \
    lxappearance \
    catnap-git \
    visual-studio-code-bin \
    spotify \
    mullvad-vpn \
    btop-git \
    zen-browser-bin \
    waybar-git \
    hyprland-git \
    hyprpaper-git \

# Enable LightDM Service
echo -e "Enabling LightDM service...\n"
sudo systemctl enable lightdm

# Set fish as default shell
echo -e "Setting fish as default shell...\n"
chsh -s $(which fish)

sudo tee /usr/share/wayland-sessions/hyprland.desktop > /dev/null <<EOL
[Desktop Entry]
Name=Hyprland
Comment=Hyprland Wayland Session
Exec=Hyprland
Type=Application
DesktopNames=Hyprland
EOL

echo -e "Hyprland setup complete!\n"

echo -e "Setup complete!\n"
