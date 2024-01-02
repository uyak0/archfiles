#!/bin/bash

# Color
CYAN = "\e[96m"
CLEAR = "\e[0m"

# Dependecies
echo -e "${CYAN}Installing dependencies with yay...${CLEAR}"
yay -S neovim rofi swaync waybar kitty hyprland

# Config dotfiles
echo -e "${CYAN}Cloning dotfiles repos...${CLEAR}"
git clone git@github.com:uyak0/dotfiles.git $HOME/dotfiles

echo -e "${CYAN}Cloning rofi config...${CLEAR}"
git clone https://github.com/adi1090x/rofi.git $HOME/rofi

cd $HOME/rofi
chmod +x $HOME/rofi/setup.sh
$HOME/rofi/setup.sh

cd $HOME

# waybar
if [ ! -d "$HOME/.config/waybar" ]; then
    echo -e"${CYAN}waybar config directory doesn't exists, making it now..."
    mkdir $HOME/.config/waybar
    echo -e"${CYAN}waybar config directory made! Installing waybar configurations..."    
    cp -a $HOME/dotfiles/waybar/. $HOME/.config/waybar
    echo -e"${CYAN}waybar configuration installed!"
else 
    echo -e"${CYAN}waybar config directory already exists, installing waybar configurations..."    
    cp -a $HOME/dotfiles/waybar/. $HOME/.config/waybar
    echo -e"${CYAN}waybar configuration installed!"
fi

# Hyprland config
if [ ! -d "$HOME/.config/hypr" ]; then
    echo -e"${CYAN}hyprland config directory doesn't exists, making it now..."
    mkdir $HOME/.config/hypr
    echo -e"${CYAN}hyprland config directory made! Installing hyprland configurations..."    
    cp -a $HOME/dotfiles/hypr/. .config/hypr
    echo -e"${CYAN}hyprland configuration installed!"
else 
    echo -e"${CYAN}hypr config directory already exists, installing hyprland configurations..."
    cp -a $HOME/dotfiles/hypr/. $HOME/.config/hypr
    echo -e"${CYAN}hyprland configuration installed!"
fi

# Kitty config
if [ ! -d "$HOME/.config/kitty" ]; then
    echo -e"${CYAN}kitty config directory doesn't exists, making it now..."
    mkdir $HOME/.config/kitty
    echo -e"${CYAN}kitty config directory made! Installing kitty configurations..."    
    cp -a $HOME/dotfiles/.kitty .config/kitty
    echo -e"${CYAN}kitty configuration installed!"
else 
    echo -e"${CYAN}kitty config directory already exists, installing kitty configurations..."
    cp -a $HOME/dotfiles/.kitty $HOME/.config/kitty
    echo -e"${CYAN}kitty configuration installed!"
fi

# swaync config
if [ ! -d "$HOME/.config/swaync" ]; then
    echo -e"${CYAN}swaync config directory doesn't exists, making it now..."
    mkdir $HOME/.config/swaync
    echo -e"${CYAN}swaync config directory made! Installing swaync configurations..."    
    cp -a $HOME/dotfiles/.swaync .config/swaync
    echo -e"${CYAN}swaync configuration installed!"
else 
    echo -e"${CYAN}swaync config directory already exists, installing swaync configurations..."
    cp -a $HOME/dotfiles/.swaync $HOME/.config/swaync
    echo -e"${CYAN}swaync configuration installed!"
fi
