#!/bin/bash

# install starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo "eval \"\$(starship init bash)\"" >> ~/.bashrc
mkdir -p ~/.config
cp starship.toml ~/.config

# vim
# install lightline
git clone --depth=1 https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/"start"/lightline
rm -rf ~/.vim/pack/plugins/"start"/lightline/.git

# install monokai pro
git clone --depth=1 https://github.com/phanviet/vim-monokai-pro.git ~/monokai
mkdir -p ~/.vim/{colors,"autoload"/lightline/colorscheme}
cp ~/monokai/colors/* ~/.vim/colors
cp ~/monokai/"autoload"/lightline/colorscheme/* ~/.vim/"autoload"/lightline/colorscheme
rm -rf ~/monokai

cp .vimrc ~

