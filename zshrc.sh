#!/usr/local/bin/zsh
LC_ALL=nl_NL.UTF-8
LANG=nl_NL.UTF-8
export LC_ALL LANG

# zsh
autoload -U add-zsh-hook

# oh-my-zsh
export ZSH=~/.oh-my-zsh
ZSH_THEME="agkozak"
HISTSIZE=99999
export UPDATE_ZSH_DAYS=13
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(brew docker git gitignore history node npm osx tmux vscode xcode yarn)
source $ZSH/oh-my-zsh.sh

export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

LDFLAGS="-L/usr/local/opt/libxml2/lib $LDFLAGS"
CPPFLAGS="-I/usr/local/opt/libxml2/include $CPPFLAGS"

#
# Postgresql
PG_HOME="/Applications/Postgres.app/Contents/Versions/11"
[[ -d $PG_HOME ]] && PATH="${PATH}:${PG_HOME}/bin"

#
# update
function update() {
    brew update && brew upgrade && brew cask upgrade
}

# Node
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[[ -d $NVM_DIR ]] && nvm use default

# Python
alias python=python3
alias pip=pip3

# uses homebrew's version of curl
PATH="/usr/local/opt/curl/bin:$PATH"
LDFLAGS="-L/usr/local/opt/curl/lib $LDFLAGS"
CPPFLAGS="-I/usr/local/opt/curl/include $CPPFLAGS"

# The Fuck
eval $(thefuck --alias)

# Flutter
[[ -d /usr/local/flutter ]] && PATH=$PATH:/usr/local/flutter/bin

# Prefer exa
[[ -x /usr/local/bin/exa ]] && alias ls="exa"

# Ruby
PATH="/Users/janpaul/.rbenv/shims:${PATH}"
export RBENV_SHELL=zsh
source '/usr/local/Cellar/rbenv/1.1.2/libexec/../completions/rbenv.zsh'
command rbenv rehash 2>/dev/null
rbenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}

# Homebrew
PATH=~/bin:/usr/local/bin:$PATH
export HOMEBREW_INSTALL_CLEANUP=true

# configure the prompt
AGKOZAK_MULTILINE=0
AGKOZAK_COLORS_EXIT_STATUS=red
AGKOZAK_COLORS_USER_HOST=green
AGKOZAK_COLORS_PATH=blue
AGKOZAK_COLORS_BRANCH_STATUS=yellow

# Completely block all autocorrect
unsetopt correct_all
unsetopt correct

# export shizzle
export PATH
export LDFLAGS
export CPPFLAGS
export PKG_CONFIG_PATH
export EDITOR=vim
export EMAIL=janpaul@elidon.net