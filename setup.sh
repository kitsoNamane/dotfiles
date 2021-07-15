#! /bin/bash

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

# install zsh
sudo apt install zsh -y

# set zsh as the default shell
chsh -s /usr/bin/zsh

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# add brew to system path
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#TODO copy configurations files 