#!/bin/bash

brew install pyenv, nvm
brew install rustup

echo 'eval "$(pyenv init -)"' >> $HOME/.zshrc

echo "export NVM_DIR="$HOME/.nvm"" >> $HOME/.zshrc
echo "[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm" >> $HOME/.zshrc
echo "[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"" >> $HOME/.zshrc

rustup-init
echo "source $HOME/.cargo/env" >> $HOME/.zshrc

mkdir $HOME/.flutter/
git clone https://github.com/flutter/flutter.git -b stable $HOME/.flutter/flutter
echo 'export PATH="$PATH:$HOME/.flutter/flutter/bin"' >> $HOME/.zshrc
source $HOME/.zshrc
flutter
flutter doctor

curl -s "https://get.sdkman.io" | bash
echo '[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"' >> $HOME/.zshrc

