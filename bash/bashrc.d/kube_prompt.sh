kpon() { echo 'true' > /tmp/kubeprompt; }
kpoff() { echo 'false' > /tmp/kubeprompt; }

_kubeprompt() {
  if [[ -e /tmp/kubeprompt ]] && [[ "$(cat /tmp/kubeprompt)" == 'true' ]]; then
    cur_ctx="$( kubectl config view -o=jsonpath='{.current-context}' )"
    cur_ns="$( kubectl config view -o=jsonpath="{.contexts[?(@.name==\"${cur_ctx}\")].context.namespace}" )"
    [ -z "${cur_ns}" ] && cur_ns='default'
    echo "[${cur_ctx}:${cur_ns}]"
  fi
}
