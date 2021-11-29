#!/bin/bash

# Update the apt package index and upgrade system.
sudo apt update
sudo apt upgrade

# Update the apt package index, and install the latest version of Docker Engine and containerd.
sudo apt install \
    apt-transport-https \ # allow apt to download over https
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

sudo apt install build-essential git -y

sudo apt install curl timeshift -y

# install zsh
sudo apt install zsh -y

# set zsh as the default shell
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install gnome-tweaks
sudo apt install gnome-tweaks

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#TODO copy configurations files 
