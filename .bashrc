# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash prompt
export PS1="\n\[$(tput bold)\]\u\[$(tput sgr0)\]@\[$(tput bold)\]\h\[$(tput sgr0)\]:\w \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\n[\A] \\$ \[$(tput sgr0)\]"
eval "$(starship init bash)"

alias ls="ls --color=auto"

# cat with syntax highlighting
alias cat="bat"
export BAT_THEME=base16-256

# htop: interactive process viewer
alias top="htop"
