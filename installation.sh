#!/bin/bash

# Dependecies
echo "Installing dependencies with yay..."
yay -S neovim rofi swaync waybar kitty hyprland

# Config dotfiles
echo "Cloning dotfiles repos..."
git clone git@github.com:uyak0/dotfiles.git $HOME/dotfiles

echo "Cloning rofi config..."
git clone https://github.com/adi1090x/rofi.git $HOME/rofi

cd $HOME/rofi
chmod +x $HOME/rofi/setup.sh
$HOME/rofi/setup.sh

cd $HOME

# waybar
if [ ! -d "$HOME/.config/waybar" ]; then
    echo "waybar config directory doesn't exists, making it now..."
    mkdir $HOME/.config/waybar
    echo "waybar config directory made! Installing waybar configurations..."    
    cp -a $HOME/dotfiles/waybar/. $HOME/.config/waybar
    echo "waybar configuration installed!"
else 
    echo "waybar config directory already exists, installing waybar configurations..."    
    cp -a $HOME/dotfiles/waybar/. $HOME/.config/waybar
    echo "waybar configuration installed!"
fi

# Hyprland config
if [ ! -d "$HOME/.config/hypr" ]; then
    echo "hyprland config directory doesn't exists, making it now..."
    mkdir $HOME/.config/hypr
    echo "hyprland config directory made! Installing hyprland configurations..."    
    cp -a $HOME/dotfiles/hypr/. .config/hypr
    echo "hyprland configuration installed!"
else 
    echo "hypr config directory already exists, installing hyprland configurations..."
    cp -a $HOME/dotfiles/hypr/. $HOME/.config/hypr
    echo "hyprland configuration installed!"
fi

# Kitty config
if [ ! -d "$HOME/.config/kitty" ]; then
    echo "kitty config directory doesn't exists, making it now..."
    mkdir $HOME/.config/kitty
    echo "kitty config directory made! Installing kitty configurations..."    
    cp -a $HOME/dotfiles/.kitty .config/kitty
    echo "kitty configuration installed!"
else 
    echo "kitty config directory already exists, installing kitty configurations..."
    cp -a $HOME/dotfiles/.kitty $HOME/.config/kitty
    echo "kitty configuration installed!"
fi

# swaync config
if [ ! -d "$HOME/.config/swaync" ]; then
    echo "swaync config directory doesn't exists, making it now..."
    mkdir $HOME/.config/swaync
    echo "swaync config directory made! Installing swaync configurations..."    
    cp -a $HOME/dotfiles/.swaync .config/swaync
    echo "swaync configuration installed!"
else 
    echo "swaync config directory already exists, installing swaync configurations..."
    cp -a $HOME/dotfiles/.swaync $HOME/.config/swaync
    echo "swaync configuration installed!"
fi