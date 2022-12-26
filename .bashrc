# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# McFly: replace your default ctrl-r
eval "$(mcfly init bash)"

# Bash prompt
export PS1="\n\[$(tput bold)\]\u\[$(tput sgr0)\]@\[$(tput bold)\]\h\[$(tput sgr0)\]:\w \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\n[\A] \\$ \[$(tput sgr0)\]"
eval "$(starship init bash)"

alias ls="ls --color=auto"

# cat with syntax highlighting
alias cat="bat"
export BAT_THEME=base16

# htop: interactive process viewer
alias top="htop"

# Git
function init-repo() {
    local dir=.
    if [ "$#" -gt  "0" ]; then dir=$1; mkdir -p $1; fi
    echo '* text=auto eol=lf' > $dir/.gitattributes
    git init $dir
}

function gen-gi() {
    curl -sL https://www.toptal.com/developers/gitignore/api/$@
}

export LEWWCOM_REPO=https://github.com/lewwcom

# Docker
function update-docker-images() {
    docker images --format '{{.Repository}}:{{.Tag}}' |
    xargs --max-args=1 --no-run-if-empty docker pull
}

