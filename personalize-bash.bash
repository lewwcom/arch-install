#!/bin/bash

# install starship
# sh -c "$(curl -fsSL https://starship.rs/install.sh)" -> Install using package manager
echo "eval \"\$(starship init bash)\"" >> ~/.bashrc
mkdir -p ~/.config
cp starship.toml ~/.config

# vim
# install lightline
git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/"start"/lightline

# install sonokai
git clone --depth=1 https://github.com/sainnhe/sonokai.git ~/sonokai
cp -r ~/sonokai/{autoload,colors,doc} ~/.vim
rm -rf ~/sonokai

cp .vimrc ~

