#!/usr/bin/env bash

set_git_configuration() {
  yasha --GIT_NAME="${GIT_NAME}" --GIT_EMAIL="$GIT_EMAIL" .gitconfig.j2
}

set_symlinks() {
  for p in '.vim/vimrc' '.tmux.conf' '.zshrc' \
    '.ctags' '.alacritty.yml' '.tern-config' \
    '.helpers.sh' '.inputrc' '.gitignor' \
    '.tmux-powerlinerc' '.editorconfig' \
    'extras' '.tmux' 'forgit.plugin.sh'; do
    t=$p

    case $t in
    ".vim/vimrc")
      t='.vimrc'
      ;;
    ".gitignor")
      t='.gitignore'
      ;;
    esac

    ln -nsf "$HOME/dotfiles/$p" "$HOME/$t"
  done
}

init_submodules() {
  git submodule update --init --recursive
}

silence() {
  brew analytics off
}

init() {
  silence

  cd ~/dotfiles || exit
  echo "Setting up Git ..."
  set_git_configuration

  echo "Setting symlinks ..."
  set_symlinks

  echo "Initializing submodules ..."
  init_submodules

  echo "Installing junegunn/vim-plug ..."
  curl -fLo .vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Installing tmux tpm ..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  echo "Fetching forgit.plugin.zsh ..."
  curl -so forgit.plugin.sh https://raw.githubusercontent.com/wfxr/forgit/master/forgit.plugin.zsh

  echo "Finito ."
  cd - || return
}

init
