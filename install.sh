#!/bin/bash
# install infinality + add repos for arch
cd ~
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
mkdir .vim
sh /tmp/installer.sh ~/.vim
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
git clone https://github.com/chriskempson/base16-xresources.git ~/.config/base16-xresources
