# This file is meant to be sourced from bashrc

_aws_list_profiles() {
    gawk '/^\[profile/ {  gsub(/\]/, ""); print  $2}' ~/.aws/config
}

awsprofile() {
    local profiles changed
    
    profiles="$(_aws_list_profiles)"
    changed=0
    
    if [[ $# -eq 0 ]]; then
        echo $profiles | tr ' ' '\n'
        return 0
    fi

    for profile in $profiles; do
        if [[ "$1" == "$profile" ]]; then
            export AWS_PROFILE=$1
            changed=1
            break
        fi
    done

    if [[ "$changed" -eq 1 ]]; then
        echo "AWS profile changed to $1."
        return 0
    else
        echo "Profile $1 doesn't exist."
        return 1
    fi
}

_awsprofile_completion() {
  COMPREPLY=($(compgen -W "$(_aws_list_profiles)" -- "${COMP_WORDS[1]}"))

}
complete -F _awsprofile_completion awsprofile