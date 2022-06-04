#!/bin/bash

# install starship
# sh -c "$(curl -fsSL https://starship.rs/install.sh)" -> Install using package manager
echo "eval \"\$(starship init bash)\"" >> ~/.bashrc
mkdir -p ~/.config
curl https://starship.rs/presets/toml/nerd-font-symbols.toml --output ~/.config/starship.toml

# install lightline - vim
git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline

cp .vimrc ~

# git
git config --global user.name "lewwcom"
git config --global user.email "lewwcom@outlook.com"
git config --global alias.graph "log --oneline --graph --all"
