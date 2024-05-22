# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# thefuck: a magnificient app that corrects errors in previous console commands
eval $(thefuck --alias)

# McFly: replace your default ctrl-r
# eval "$(mcfly init bash)"

# fzf: fzf is a general-purpose command-line fuzzy finder
eval "$(fzf --bash)"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

# Bash prompt
export PS1="\n\[$(tput bold)\]\u\[$(tput sgr0)\]@\[$(tput bold)\]\h\[$(tput sgr0)\]:\w \$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\n[\A] \\$ \[$(tput sgr0)\]"
eval "$(starship init bash)"

alias ls="ls --color=always"
alias grep="grep --color=always"

# cat with syntax highlighting
alias cat="bat"
export BAT_THEME=base16

# htop: interactive process viewer
alias top="sudo htop"

# weather
alias weather="curl wttr.in"

# Git
function init-repo() {
    local dir=.
    if [ "$#" -gt  "0" ]; then dir=$1; mkdir -p $1; fi
    echo '* text=auto eol=lf' > $dir/.gitattributes
    git init $dir

    local username=$(git config --get user.name)
    read -p "Username (default: $username): " new_username
    if [ ! -z "$new_username" ]; then
        git config user.name "$new_username"
    fi

    local email=$(git config --get user.email)
    read -p "Email (default: $email): " new_email
    if [ ! -z "$new_email" ]; then
        git config user.email "$new_email"
    fi
}

function gen-gi() {
    curl -sL https://www.toptal.com/developers/gitignore/api/$@
}

export LEWWCOM_REPO=https://github.com/lewwcom

function codecommit-clone {
    local repo=$1
    local dest=$2
    local url=$(
        aws codecommit get-repository --repository-name "$repo" |
            jq -r '.repositoryMetadata.cloneUrlHttp'
    )
    git clone "$url" $2
}

function download-latest-gh-release {
    local repo=$1
    local file_name_pattern=$2

    # `cut --delimiter '"' --fields 4` doesn't work on macOS
    local download_url=$(
        curl --fail --silent --show-error --location \
            https://api.github.com/repos/localstack/localstack-cli/releases/latest |
            jq --raw-output "
                .assets[]
                | select(.name | test(\"$file_name_pattern\"))
                | .browser_download_url"
    )

    echo Downloading $download_url
    curl --location --remote-name "$download_url"
}

# Docker
function update-docker-images() {
    docker images --format '{{.Repository}}:{{.Tag}}' |
    xargs --max-args=1 --no-run-if-empty docker pull
}

