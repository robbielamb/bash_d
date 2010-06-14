function parse_git_branch {
 
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
    state="${RED}⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="${YELLOW}↑"
    else
      remote="${YELLOW}↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
   remote="${YELLOW}↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo "${LIGHT_RED}[${GREEN}${branch}${remote}${state}${LIGHT_RED}]"
  fi
}

function parse_ruby_version() {
  ruby_version="$(echo $rvm_ruby_string | awk -F'-' '{printf "%s-%s\n", $1, $2}')"
  if [[ -n $rvm_gemset_name ]]
    then
    ruby_version="${ruby_version}@${rvm_gemset_name}"
  fi
  echo "${RED}[${COLOR_NONE}$ruby_version${RED}]${COLOR_NONE}"
}

function prompt_func() {
    previous_return_value=$?;
    # rnd_color=$RANDOM%ARRAY_LENGTH

    prompt="$(parse_ruby_version) $(parse_git_branch)${COLOR_NONE}\n${CYAN}<${COLOR_NONE}\u@\h${CYAN}> ${YELLOW}\w ${COLOR_NONE}"
    # prompt="\u@\h ${YELLOW}\w $(parse_git_branch)${COLOR_NONE}"
    # unicorn
    if test $previous_return_value -eq 0
    then
      PS1="${prompt}➔ "
    else
      PS1="${prompt}${RED}➔${COLOR_NONE} "
    fi
}                                                                  
 
PROMPT_COMMAND=prompt_func
