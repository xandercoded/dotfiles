export ZSH=/Users/xandercoded/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"
SPACESHIP_VI_MODE_COLOR=red
SPACESHIP_VI_MODE_INSERT=i
SPACESHIP_VI_MODE_NORMAL=n

export LANG=en_US.UTF-8
export UPDATE_ZSH_DAYS=2
export DISABLE_AUTO_TITLE="true"
#ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(
  ansible
  fzf
  git
  osx
  docker
  vi-mode
  colorize
  encode64
  man
  #aws
  #node
)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
export EDITOR='vim'
bindkey -v
export KEYTIMEOUT=1
export FCEDIT=vim

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias gla="git log --all --decorate --oneline --graph"

alias goo="googler"
alias goon="googler -N"

# tmux
alias tp="tmuxp"
alias tpl="tp load"

# CTAGS alias to brew'd version
alias ctags="/usr/local/bin/ctags"

# helper aliases
alias fkill=fzf_process_kill

[ -n "$PS1" ] && source ~/.bash_profile

# Source personal helpers
[ -f ~/.helpers.sh ] && source ~/.helpers.sh

[[ -s /usr/local/etc/profile.d/autojump.sh ]] && . /usr/local/etc/profile.d/autojump.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/ansible@2.0/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/Users/xandercoded/Library/Python/3.7/lib:$PATH"
export PATH="/Users/xandercoded/Library/Python/3.7/bin:$PATH"
export PATH="/usr/local/bin/python3:$PATH"
export PATH="/usr/local/bin/vim:$PATH"
# golang
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="/Users/xandercoded/go/"
