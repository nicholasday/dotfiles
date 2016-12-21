#!/bin/bash
# install infinality + add repos for arch
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
rm -rf ~/.vim
mkdir ~/.vim
sh /tmp/installer.sh ~/.vim
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
git clone https://github.com/chriskempson/base16-xresources.git ~/.config/base16-xresources
cargo install rustfmt
cargo install racer
rustup component add rust-src
p -S termite
p -S ripgrep
pacaur -S universal-ctags-git
