#!/bin/bash

# Author : Ruturajn <nanotiruturaj@gmail.com> 
# Copyright (c) 2022, Ruturaj A. Nanoti, All Rights Reserved
# Run this script for setting up the Rice.

BRed="\e[1;31m" 
BGreen="\e[1;32m"
BYellow="\e[1;33m"
BBlue="\e[1;34m"
End_Colour="\e[0m"

# Install the required packages for the Rice
echo -e "${BYellow}[ * ]Installing packages${End_Colour}"
sudo pacman -Syyu neofetch htop nitrogen xorg fish rofi picom qtile dunst \
python-dbus linux-headers base base-devel p7zip unzip tar python-pip \
papirus-icon-theme cmatrix pamixer feh alsa-utils pavucontrol

# Adding a swapfile
read -p "[1;34m[ * ]Do you want to create a swapfile [Y/n]:[0m" ans
if [[ -z ${ans} || ${ans} == "y" || ${ans} == "Y" ]] ; then
    echo -e "${BYellow}[ * ]Creating 4G swapfile${End_Colour}"
    sudo dd if=/dev/zero of=/swapfile bs=1M count=4096
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile
    echo "/swapfile                                       none            swap            defaults        0 0" | sudo tee -a /etc/fstab
    echo -e "$${BGreen}Swapfile creation and configuration successfull !!${End_Colour}"
elif [[ ${ans} == "n" || ${ans} == "N" ]] ; then
    echo -e "${BRed}Skipping Swapfile creation${End_Colour}"
else
    echo -e "${BRed}Not a valid option, Skipping Swapfile creation${End_Colour}"
fi

# Install stuff with pip
echo -e "${BYellow}[ * ]Installing fontawesome and dbus-next for icons and notifications${End_Colour}"
sudo pip3 install psutil fontawesome dbus-next

# Install `yay` as the AUR Helper, interact wherever required
read -p "[1;34m[ * ]Do you want to install yay as the AUR Helper? [Y/n]:[0m" aur_ans
if [[ -z ${aur_ans} || ${aur_ans} == "y" || ${aur_ans} == "Y" ]] ; then
    echo -e "${BYellow}[ * ]Installing yay as the AUR Helper${End_Colour}"
    sudo git clone https://aur.archlinux.org/yay.git
    sudo chown -R "${USER}":"${USER}" yay
    cd ./yay || exit
    makepkg -si
    aur_name="yay"  
elif [[ ${aur_ans} == "n" || ${aur_ans} == "N" ]] ; then
    read -p "[1;34m[ * ]Please enter the name of the installed AUR Helper? [Y/n]:[0m" aur_name
else
    echo -e "${BRed}FATAL : Cannot proceed without an AUR Helper !!{End_Colour}"
fi

# Upgrade system with yay
echo -e "${BYellow}[ * ]Updating and Upgrading system with ${aur_name}${End_Colour}"
"${aur_name}" -Syu

# Install lsd for the ls command and qtile-extras from desired AUR Helper
echo -e "${BYellow}[ * ]Installing lsd and qtile-extras with ${aur_name}${End_Colour}"
"${aur_name}" -S lsd qtile-extras-git

# Install the required fonts
echo -e "${BYellow}[ * ]Installing Fantasque Sans Mono Nerd Font and JetBrains Mono Font with ${aur_name}${End_Colour}"
"${aur_name}" -S nerd-fonts-fantasque-sans-mono ttf-jetbrains-mono 

# Getting pfetch as fetch tool
echo -e "${BYellow}[ * ]Installing pfetch as the fetch tool${End_Colour}"
mkdir "${HOME}"/Git-repos
cd "${HOME}"/Git-repos || exit
git clone https://github.com/dylanaraps/pfetch.git
cd ./pfetch || exit
sudo cp ./pfetch /usr/bin/pfetch

# Clone the Dotfiles Repo and place all the folders in the $(HOME)/.config directory
echo -e "${BYellow}[ * ]Cloning the Dotfiles repo${End_Colour}"
git clone https://github.com/Ruturajn/Dotfiles.git
cd ./Dotfiles || exit

echo -e "${BYellow}[ * ]Placing dunst folder in ~/.config/dunst and making vol_script executable${End_Colour}"
cp -r ./dunst "${HOME}"/.config
chmod +x "${HOME}"/.config/dunst/vol_script

echo -e "${BYellow}[ * ]Placing rofi folder in ~/.config/rofi${End_Colour}"
echo place the rofi folder to .config
cp -r ./rofi "${HOME}"/.config

echo -e "${BYellow}[ * ]Placing qtile/config.py and qtile/autostart.sh folder in ~/.config/qtile  and making autostart.sh executable${End_Colour}"
mkdir -p "${HOME}"/.config/qtile
cp ./qtile/config.py "${HOME}"/.config/qtile/config.py
cp ./qtile/autostart.sh "${HOME}"/.config/qtile/
echo "feh --bg-scale ${HOME}/Git-repos/Dotfiles/Wallpapers/5120x2880.jpg" | sudo tee -a "${HOME}"/.config/qtile/autostart.sh
chmod +x "${HOME}"/.config/qtile/autostart.sh

echo -e "${BYellow}[ * ]Placing alacritty config in ~/.config/${End_Colour}"
cp ./alacritty.yml ~/.config/

echo -e "${BYellow}[ * ]Placing .vimrc in ~/${End_Colour}"
cp ./.vimrc "${HOME}"/

echo -e "${BYellow}[ * ]Placing picom config in ~/.config/picom${End_Colour}"
mkdir -p "${HOME}"/.config/picom
cp ./picom.conf "${HOME}"/.config/picom/

# Install omf and change default shell to fish
read -p "[1;34m[ * ]Do you want to change the default shell to fish [Y/n]:[0m" shell_ans
if [[ -z ${shell_ans} || ${shell_ans} == "y" || ${shell_ans} == "Y" ]] ; then
    echo -e "${BYellow}[ * ]Changing Default shell to fish and installing omf with robbyrussell theme${End_Colour}"
    chsh -s /usr/bin/fish
    echo -e "${BYellow}[ * ]Placing fish config in ~/.config/fish${End_Colour}"
    mkdir -p "${HOME}"/.config/fish
    cp ./fish/config.fish "${HOME}"/.config/fish/config.fish
elif [[ ${shell_ans} == "y" || ${shell_ans} == "Y" ]] ; then
    echo -e "${BRed}Skipping Shell change${End_Colour}"
else
    echo -e "${BRed}Not a valid option, Skipping Shell change${End_Colour}"
fi

# Enable lightdm service with the following steps
read -p "[1;34m[ * ]Do you want to install the lightdm login manager?[Y/n]:[0m" lightdm_ans
if [[ -z ${lightdm_ans} || ${lightdm_ans} == "y" || ${lightdm_ans} == "Y" ]] ; then
    echo -e "${BYellow}[ * ]Installing Lightdm${End_Colour}"
    sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
    echo -e "${BYellow}[ * ]Uncommenting 'greeter-session' option in '/etc/lightdm/lightdm.conf' and replacing with 'greeter-session=lightdm'${End_Colour}"
    sudo sed -i "s/# greeter-session = Session to load for greeter/greeter-session=lightdm/g" /etc/lightdm/lightdm.conf
    echo -e "${BYellow}[ * ]Starting the lightdm service at boot with 'sudo systemctl enable lightdm.service'${End_Colour}"
    sudo systemctl enable lightdm.service 
    echo -e "${BYellow}[ * ]Reboot the system with 'sudo systemctl reboot'${End_Colour}"    
elif [[ ${lightdm_ans} == "y" || ${lightdm_ans} == "Y" ]] ; then
    echo -e "${BRed}Skipping Lightdm Installation${End_Colour}"
else
    echo -e "${BRed}Not a valid option, Skipping Lightdm Installation${End_Colour}"
fi

# Installation Success
echo -e "${BGreen}Installation Successfull, Logout and Login to Qtile!!${End_Colour}"
