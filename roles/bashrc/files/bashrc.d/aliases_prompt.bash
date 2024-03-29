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

kpon() { echo 'true' > /tmp/kubeprompt; }
kpoff() { echo 'false' > /tmp/kubeprompt; }

# _kubeprompt is used on $PS1 to show the k8s ctonext used if /tmp/kubeprompt exists.
# This  is inspired on https://github.com/jonmosco/kube-ps1
# I had problems with kube-ps1 and character encoding on my terminal. And it was
# faster to adapt a simpler version of the script.
_kubeprompt() {
  if [[ -e /tmp/kubeprompt ]] && [[ "$(cat /tmp/kubeprompt)" == 'true' ]]; then
    cur_ctx="$( kubectl config view -o=jsonpath='{.current-context}' )"
    cur_ns="$( kubectl config view -o=jsonpath="{.contexts[?(@.name==\"${cur_ctx}\")].context.namespace}" )"
    [ -z "${cur_ns}" ] && cur_ns='default'
    echo "[${cur_ctx}:${cur_ns}]"
  fi
}
