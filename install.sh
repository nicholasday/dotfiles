#!/bin/bash
# install infinality + add repos for arch
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
rm -rf ~/.vim
mkdir ~/.vim
sh /tmp/installer.sh ~/.vim
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
git clone https://github.com/chriskempson/base16-xresources.git ~/.config/base16-xresources
