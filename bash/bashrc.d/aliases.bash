# vim: set filetype=sh:
# This file is meant to be sourced from bashrc

# Aliases

# Some aliases I use for work that I don't want to push to a public repo :P
[ -e aliases_mytheresa.bash ] && source aliases_mytheresa.bash

alias ls="ls --color"
alias ll="ls -l"
alias la="ls -la"
alias grep="grep --color"

alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias ln='ln -v'

repos_path=~/dev/vidi
alias repos="cd ${repos_path}"
alias dotfiles="cd ${repos_path}/dotfiles"

alias reloadbash='source ~/.bashrc'
alias editalias="vim \${HOME}/.bashrc.d/aliases.bash"
alias editsecrets="vim \${HOME}/.bashrc.d/secrets.bash"
alias editvars="vim \${HOME}/.bashrc.d/variables.bash"
alias editvimrc="vim \${HOME}/.vimrc"
alias vimrc="editvimrc"

alias gopath="cd \${GOPATH}/src/github.com/Vidimensional"

alias gti='git' #Fuck this typo.
alias g='git'
alias k='kubectl'
alias d='docker'

alias unvim="find . -iname '.*.swp' -delete"

alias tiempo="curl wttr.in/"

which hub >/dev/null && alias git="hub"

#Access Docker4Mac xhyve virtual machine.
alias sshdocker='screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty'

#Commands running on Docker containers.
#alias psql='docker run -it -v "${PWD}:/opt" -e "PGPASSWORD=${PGPASSWORD}" vidimensional/psql'
alias mysql='docker run -it vidimensional/mysql-client'
#alias jq='docker run -i -v "${PWD}:/opt/jq/workspace" vidimensional/jq'
alias describe_ec2_instances='docker run --rm -e AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" vidimensional/describe_ec2_instances'
#alias slack='docker run --rm -e "SLACK_CLI_USERNAME=$SLACK_CLI_USERNAME" -e "SLACK_CLI_URL=$SLACK_CLI_URL" vidimensional/slack_cli'
#alias aws='docker run -it -v ~/.aws:/root/.aws -v ${PWD}:/project mesosphere/aws-cli'
#alias ansible-vault='docker run -it --rm -v "${PWD}:/opt/workspace" --entrypoint /usr/local/bin/ansible-vault vidimensional/ansible'

#alias kctl_proxy='kubectl proxy >/dev/null 2>&1 &'
alias terminate_instance='aws ec2 terminate-instances --instance-ids'

# Turns tabs into 4 spaces.
alias untab='sed "s/\t/    /g"' 

#alias uupgrade='sudo apt update && sudo apt upgrade' #Ubuntu upgrade
uupgrade(){
sudo apt update || return
sudo apt upgrade || return
#pip list --outdated --format=freeze | cut -d= -f1 | xargs -I{} -- sudo -H -- pip install -U  {}  Since PIP is broken on my machine.
}

# Funciones
myip() {
    curl 'https://canihazip.com/s'
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

__gpullpush() {
    local do_push='1'
    if [ "$1" == 'no_push' ] || [ "$1" == 'nopush' ] || [ "$1" == 'no-push' ]; then
        do_push=''
    fi

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

    if  git branch -r | grep -q "${branch_name}"; then
        __log "$git_pull_cmd"
        if ! $git_pull_cmd; then
            local ret_val=$?
            if [ "$stash" -eq 1 ]; then
                __log "$git_stash_pop_cmd"
                $git_stash_pop_cmd
            fi
            return $ret_val
        fi
    fi


    if [ -n "${do_push}" ]; then
        __log "$git_push_cmd"
        $git_push_cmd
    fi

    if [ "$stash" -eq 1 ]; then
        __log "$git_stash_pop_cmd"
        $git_stash_pop_cmd
    fi
    
}

gpush() {
    __gpullpush
}

gpull() {
    __gpullpush nopush
}
