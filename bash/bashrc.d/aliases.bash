# vim: set filetype=sh:
# This file is meant to be sourced from bashrc

# Aliases

alias ls="ls --color"
alias ll="ls -l"
alias la="ls -la"
alias grep="grep --color"

alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'

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

gpush() {
    branch="$(git symbolic-ref HEAD)"
    branch_name="${branch##refs/heads/}"

    echo -e "-> ${__YELLOW}git pull --rebase origin ${branch_name}${__DEFAULT}"
    git pull --rebase origin "${branch_name}"
    echo -e "-> ${__YELLOW}git push origin ${branch_name}${__DEFAULT}"
    git push origin "${branch_name}"
}

