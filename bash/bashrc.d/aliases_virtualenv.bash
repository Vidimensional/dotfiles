_get_virtualenv(){
    if [[ -n $VIRTUAL_ENV ]]; then
        echo "[$(echo $VIRTUAL_ENV | rev | cut -d/ -f2 | rev)]"
    fi
}