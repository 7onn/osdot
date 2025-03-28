# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         source "$BASE16_SHELL/profile_helper.sh"


# Aliases
alias gs='git status'
alias cat='bat'
alias gpull='git pull'
alias gpush='git push'
alias gcheckout='git checkout'
alias lsort='ls -alht'
alias tf='terraform'
alias py='python'
alias vim='nvim'
alias v='nvim'
alias ll='ls -alht'

# Brew
eval "$(/usr/local/bin/brew shellenv)"
# alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# User binaries
if [[ -d $HOME/bin ]] export PATH="$HOME/bin:$PATH"


# SSH and GPG agents
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Text editing
export EDITOR=nvim
bindkey "\e[1;3D" backward-word # ⌥←
bindkey "\e[1;3C" forward-word # ⌥→
# bindkey "\e[1;5D" backward-word   # ^←
# bindkey "\e[1;5C" forward-word    # ^→

# Secrets
if [ -f "$HOME/.zsh/secrets.zsh" ]; then source "$HOME/.zsh/secrets.zsh"; fi

# Go
export GOPROXY="https://proxy.golang.org,direct"
export GOSUMDB="sum.golang.org"
export GOROOT=/usr/local/opt/go/libexec/
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
export PATH="$PATH:$GOBIN"


# Kubernetes
export KUBE_CONFIG_PATH=~/.kube/config
#source ~/.zsh/k8s.zsh
source ~/.zsh/fubectl.zsh
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


# Java
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
# export PATH="$HOME/pkg/kotlin-language-server/server/build/scripts:$PATH"
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"
# export JAVA_HOME="$(/usr/libexec/java_home -v 11)"
#export JAVA_HOME="$(/usr/libexec/java_home -v 17)"

# Python
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# Created by `pipx` on 2024-12-02 09:29:15
export PATH="$PATH:/Users/tom/.local/bin"
# Created by `pipx` on 2024-12-02 09:29:22
export PATH="$PATH:/Users/tom/Library/Python/3.11/bin"


# Google Cloud
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json"
if [ -f "$HOME/pkg/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/pkg/google-cloud-sdk/path.zsh.inc"; fi

# Terraform
#export PATH="$HOME/.tfenv/bin:$PATH"


# Rust
export PATH="$HOME/.cargo/bin:$PATH"
source "$HOME/.cargo/env"


# Containers
export DOCKER_DEFAULT_PLATFORM=linux/amd64


# Functions
source ~/.zsh/functions.zsh


# Javascript
#export DENO_INSTALL="$HOME/.deno"
#export PATH="$DENO_INSTALL/bin:$PATH"



# Package managers
eval "$(fnm env --use-on-cd --shell zsh)"
alias nvm='fnm'
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#. "$HOME/.local/bin/env"

export PNPM_HOME="/Users/tom/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


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
      echo -e "${YELLOW}± ${branch}*${RESET}
"
    else
      echo -e "${GREEN}± ${branch}${RESET}
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
  PS1="%1 $(dir_ps1) $(git_ps1) $(kube_ps1) 
$ "
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_ps1
