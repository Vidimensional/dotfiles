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
alias editalias="vim ${HOME}/.bashrc.d/bash.alias"
alias editsecrets="vim ${HOME}/.bashrc.d/bash.secrets"
alias editvars="vim ${HOME}/.bashrc.d/bash.variables"

alias gopath="cd ${GOPATH}/src/github.com/Vidimensional"

alias vimrc="vim ${HOME}/.vimrc"
alias editvimrc="vimrc"

alias fucking="sudo"

alias myip="wget -qO- 'http://canihazip.com/s'; echo"
alias whatsmyip="myip"

alias gti='git' #Fuck this typo.
alias g='git'

alias unvim="find . -iname '.*.swp' -delete"

alias bonusly="curl -s https://bonus.ly/api/v1/users/me?access_token=\"${BONUSLY_API_TOKEN}\" | jq '.result | { para_gastar: .earning_balance_with_currency, para_dar: .giving_balance_with_currency }'"

alias tiempo="curl wttr.in/"

which hub >/dev/null && alias git="hub"


# Funciones
startvm(){ vboxmanage startvm $1 --type=headless ;}
stopvm(){ vboxmanage controlvm $1 poweroff ;}

busca(){ find . -iname "*$1*"; }

certview(){ for cert in $@; do openssl x509 -in ${cert} -text -noout; done ; }

