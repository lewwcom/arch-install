#!/bin/bash

# starship
# sh -c "$(curl -fsSL https://starship.rs/install.sh)" -> Install using package manager
mkdir -p ~/.config
starship preset nerd-font-symbols > ~/.config/starship.toml
echo '
[username]
show_always = true
format = "[$user]($style)@(bold dimmed)"

[hostname]
ssh_only = false
format = "[$hostname $ssh_symbol]($style)in "
style = "bold yellow"

[time]
disabled = false
time_format = "%R"' >> ~/.config/starship.toml

# install lightline - vim
git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline

cp .bashrc .vimrc ~

# git
git config --global user.name "lewwcom"
git config --global user.email "lewwcom@outlook.com"
git config --global alias.graph "log --oneline --graph --all"
