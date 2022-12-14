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

alias k='kubectl'
alias d='docker'
alias dcompose='docker-compose'
alias tf='terraform'
alias ntpl='lsof -nPi4TCP | grep --color=never LISTEN' # Similar output to `netstat -ntpl`
alias goland='goland "$(pwd)"'
alias phpstorm='phpstorm "$(pwd)"'
alias idea='idea "$(pwd)"'
alias pycharm='pycharm "$(pwd)"'
alias webstorm='webstorm "$(pwd)"'

alias unvim="find . -iname '.*.swp' -delete"

alias tiempo="curl wttr.in/"

#Commands running on Docker containers.
#alias psql='docker run -it -v "${PWD}:/opt" -e "PGPASSWORD=${PGPASSWORD}" vidimensional/psql'
#alias mysql='docker run -it vidimensional/mysql-client'

#alias kctl_proxy='kubectl proxy >/dev/null 2>&1 &'
alias terminate_instance='aws ec2 terminate-instances --instance-ids'

# Turns tabs into 4 spaces.
alias untab='sed "s/\t/    /g"' 

alias dkillall='docker ps --all --format={{.ID}} | xargs -- docker rm --force'

certview(){
    for cert in $@; do
        openssl x509 -in "${cert}" -text -noout
    done
}

secret() {
    curl -s -u "${ONETIMESECRET_API_TOKEN}" -F "secret=$1" https://onetimesecret.com/api/v1/share | jq -r '"https://onetimesecret.com/secret/\(.secret_key)"'
}

__log(){
    echo -e "> ${__YELLOW}$@${__DEFAULT}"
}
