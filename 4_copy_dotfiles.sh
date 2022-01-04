#! /bin/bash

rm -r $HOME/.zshrc
ln -s $HOME/Documents/bin/dotfiles/zshrc $HOME/.zshrc

export XDG_CONFIG_HOME="$HOME/.config"
rm -r $XDG_CONFIG_HOME/nvim 
ln -s $HOME/Documents/bin/dotfiles/nvim/ $XDG_CONFIG_HOME/

mkdir -p $HOME/.golang/
