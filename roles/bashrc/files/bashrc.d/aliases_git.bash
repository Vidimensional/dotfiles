alias gti='git' #Fuck this typo.
alias g='git'

# Use hub if installed.
which hub >/dev/null && alias git="hub"

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

gcleanbranches() {
    git branch --merged master | grep -v master | xargs -I{} -- git branch -d {}
}
