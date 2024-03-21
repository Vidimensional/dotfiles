# This file is meant to be sourced from bashrc
alias d='docker'
alias dcompose='docker-compose'
alias dkillall='docker ps --all --format={{.ID}} | xargs -- docker rm --force'
