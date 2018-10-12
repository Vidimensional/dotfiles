_awsprompt() {
  local aws_profile
  aws_profile="$(env | grep AWS_PROFILE | cut -d= -f2)"
  [[ "${aws_profile}" == "" ]] && aws_profile=default
  
  echo "[AWS->${aws_profile}]"
}