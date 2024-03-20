# This file is meant to be sourced from bashrc

# Functions used tohave a dynamic prompt.

_get_virtualenv(){
    if [[ -n $VIRTUAL_ENV ]]; then
        echo "[$(echo $VIRTUAL_ENV | rev | cut -d/ -f2 | rev)]"
    fi
}

_awsprompt() {
  local aws_profile
  aws_profile="$(env | grep AWS_PROFILE | cut -d= -f2)"
  [[ "${aws_profile}" == "" ]] && aws_profile=default

  echo "[AWS->${aws_profile}]"
}
