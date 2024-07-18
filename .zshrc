# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


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
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'


# User binaries
if [[ -d $HOME/bin ]] export PATH="$HOME/bin:$PATH"


# SSH and GPG agents
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent


# Terminal hacks
source ~/.zsh/z.source
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug 'wfxr/forgit'


# Text editing
export EDITOR=nvim
bindkey "\e[1;3D" backward-word # ⌥←
bindkey "\e[1;3C" forward-word # ⌥→

# Secrets
if [ -f '~/.zsh/secrets.source' ]; then source '~/.zsh/secrets.source'; fi


# Go
export GOPROXY="https://proxy.golang.org,direct"
export GOSUMDB="sum.golang.org"
export GOROOT=/opt/homebrew/opt/go/libexec/
export GOPATH=~/go
export GOBIN="~/go/bin"
export PATH="$PATH:$GOBIN"


# Kubernetes
export KUBE_CONFIG_PATH=~/.kube/config
source ~/.zsh/k8s.zsh
source ~/.zsh/fubectl.source
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


# Java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export PATH="/Users/tom/pkg/kotlin-language-server/server/build/scripts:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export JAVA_HOME="$(/usr/libexec/java_home -v 11)"


# Python
export PATH="/Users/tom/Library/Python/3.11/bin:/Users/tom/Library/Python/3.11/lib/python/site-packages:/Users/tom/Library/Python/3.9/bin:/Users/tom/Library/Python/3.9/lib/python/site-packages:/opt/homebrew/bin/:/opt/homebrew/lib/python3.10/site-packages:/opt/homebrew/opt/python@3.10/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# Google Cloud
export GOOGLE_APPLICATION_CREDENTIALS=/Users/tom/.config/gcloud/application_default_credentials.json
if [ -f '/Users/tom/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tom/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/tom/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tom/google-cloud-sdk/completion.zsh.inc'; fi


# Terraform
export PATH="$HOME/.tfenv/bin:$PATH"


# Rust
export PATH="$HOME/.cargo/bin:$PATH"
source "$HOME/.cargo/env"


# Containers
export DOCKER_DEFAULT_PLATFORM=linux/amd64


# Functions
source ~/.zsh/functions.zsh


# Package managers
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Latest shell stuff
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}
