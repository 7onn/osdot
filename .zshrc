#!/bin/zsh

# prevent CTRL-D from closing Kitty
setopt ignore_eof

# enable completion
zstyle ':completion:*' menu select
autoload -U compinit && compinit
zmodload -i zsh/complist

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

# Secrets
if [ -f "$HOME/.zsh/secrets.zsh" ]; then source "$HOME/.zsh/secrets.zsh"; fi
if [ -f "$HOME/.zsh/nada.zsh" ]; then source "$HOME/.zsh/nada.zsh"; fi

# Go
export GOPROXY="https://proxy.golang.org,direct"
export GOSUMDB="sum.golang.org"
export GOROOT=/usr/local/opt/go/libexec/
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
export PATH="$PATH:$GOBIN"


# Kubernetes
export KUBE_CONFIG_PATH=~/.kube/config
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
. ~/.zsh/fubectl.zsh

# Cool ps1
. ~/.zsh/ps1.zsh

# Aliases
. ~/.zsh/aliases.zsh

# Bindkeys
. ~/.zsh/bindkeys.zsh


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
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/opt/homebrew/lib/pkgconfig:$PKG_CONFIG_PATH"
