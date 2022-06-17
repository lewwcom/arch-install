# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash prompt
export PS1='\n\[\e[0;1m\]\u\[\e[0;1;2m\]@\[\e[0;1m\]\h \[\e[0m\]in \[\e[0;1m\]\W \[\e[0m\](\[\e[0;2m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0m\])\n\[\e[0;2m\]at \[\e[0;1m\]\A \[\e[0m\]\$ \[\e[0m\]'
eval "$(starship init bash)"

alias ls="ls --color=auto"

# cat with syntax highlighting
alias cat="bat"
export BAT_THEME=base16-256

# htop: interactive process viewer
alias top="htop"
