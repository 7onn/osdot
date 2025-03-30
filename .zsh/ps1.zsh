#! /bin/zsh

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"
RESET="\033[0m"
ROXIN="\033[38;5;183m"

function dir_ps1() {
  echo -e "${ROXIN}⭐$(pwd)${RESET}"
}

function git_ps1() {
  branch=$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')
  if [[ -n "$branch" ]]; then
    if [[ -n "$(git diff --name-only HEAD)" ]]; then
      echo -e "${YELLOW}\UE0A0 ${branch} ±${RESET}
"
    else
      echo -e "${YELLOW}\UE0A0 ${RESET}${branch}${RESET}
"
    fi
  fi
}

function kube_ps1() {
  local ctx=$(kubectl config current-context 2>/dev/null)
  [[ -z "$ctx" ]] && return

  local ns=$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)
  [[ -z "$ns" ]] && ns="default"
  
  if [[ -n "$ctx" ]]; then
    # Color context red if it contains 'prod'
    if [[ "$ctx" == *"production"* ]]; then
      echo -e "${RED}⛵${ctx}${RESET}/${CYAN}${ns}${RESET}"
    else
      echo -e "${GREEN}⛵${ctx}${RESET}/${CYAN}${ns}${RESET}"
    fi
  fi
}


function _update_ps1() {
  PS1="%1 
$(dir_ps1) $(git_ps1) $(kube_ps1) $(date)
$ "
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_ps1
