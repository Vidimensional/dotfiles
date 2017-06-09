# vim: set filetype=sh:
# This file is meant to be sourced from bashrc

# Aliases

# Some aliases I use for work that I don't want to push to a public repo :P
[ -e aliases_typeform.bash ] && source aliases_typeform.bash

alias ls="ls --color"
alias ll="ls -l"
alias la="ls -la"
alias grep="grep --color"

alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'

alias dotfiles='cd ~/dev/repos/dotfiles'

alias reloadbash='source ~/.bashrc'
alias editalias="vim \${HOME}/.bashrc.d/aliases.bash"
alias editsecrets="vim \${HOME}/.bashrc.d/secrets.bash"
alias editvars="vim \${HOME}/.bashrc.d/variables.bash"
alias editvimrc="vim \${HOME}/.vimrc"
alias vimrc="editvimrc"

alias gopath="cd \${GOPATH}/src/github.com/Vidimensional"

alias gti='git' #Fuck this typo.
alias g='git'

alias unvim="find . -iname '.*.swp' -delete"

alias tiempo="curl wttr.in/"

which hub >/dev/null && alias git="hub"

alias describe_ec2_instances='docker run --rm -it -e AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" vidimensional/describe_ec2_instances'

# Funciones
myip() {
    curl 'http://canihazip.com/s'
    echo #Add a newline
}
alias whatsmyip="myip"

busca(){
    find . -iname "*$1*"
}

certview(){
    for cert in $@; do
        openssl x509 -in "${cert}" -text -noout
    done
}

secret() {
    curl -s -u "${ONETIMESECRET_API_TOKEN}" -F "secret=$1" https://onetimesecret.com/api/v1/share | jq -r '"https://onetimesecret.com/secret/\(.secret_key)"'
}

__log() {
    echo -e "> ${__YELLOW}$1${__DEFAULT}"
}

gpush() {
    local branch="$(git symbolic-ref HEAD)"
    local branch_name="${branch##refs/heads/}"

    local git_stash_cmd="git stash"
    local git_stash_pop_cmd="git stash pop --quiet"
    local git_pull_cmd="git pull --rebase origin ${branch_name}"
    local git_push_cmd="git push origin ${branch_name}"

    local stash
    if git diff-index --quiet HEAD --; then
        stash=0
    else
        stash=1
    fi

    if [ "$stash" -eq 1 ]; then
        __log "$git_stash_cmd"
        $git_stash_cmd || return $?
    fi

    __log "$git_pull_cmd"
    if ! $git_pull_cmd; then
        local ret_val=$?
        if [ "$stash" -eq 1 ]; then
            __log "$git_stash_pop_cmd"
            $git_stash_pop_cmd
        fi
        return $ret_val
    fi

    __log "$git_push_cmd"
    $git_push_cmd

    if [ "$stash" -eq 1 ]; then
        __log "$git_stash_pop_cmd"
        $git_stash_pop_cmd
    fi
}

gpull() {
    local branch="$(git symbolic-ref HEAD)"
    local branch_name="${branch##refs/heads/}"

    local git_pull_command="git pull --rebase origin ${branch_name}"
    __log "$git_pull_command"
    $git_pull_command
}
