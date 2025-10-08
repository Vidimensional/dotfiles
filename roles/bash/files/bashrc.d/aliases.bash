# This file is meant to be sourced from bashrc

# Aliases
alias ls="ls --color"
alias ll="ls -l"
alias la="ls -la"
alias grep="grep --color"
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias ln='ln -v'

repos_path=~/dev/vidi
alias dotfiles="code ${repos_path}/dotfiles"
alias reloadbash='source ~/.bashrc'

__log(){
    echo -e "> ${__YELLOW}$@${__DEFAULT}"
}
