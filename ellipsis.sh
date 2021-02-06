#!/usr/bin/env bash
#
# lugoues/nvim ellipsis package

requires=(nvim)

python2_req="neovim"
python3_req="neovim"

# Pull git repo.
git.pull-rebase() {
    pkg.set_globals "${1:-$PKG_NAME}"
    msg.bold "updating $PKG_NAME"
    git pull --rebase
}


_check_requires() {
  echo "$(tput setaf 2)Checking dependencies...$(tput sgr0)"
  for i in "${requires[@]}"
  do
    if ! utils.cmd_exists $i; then
      log.fail "Unmet dependency '$i'"
      return 1
    fi
  done
}

_setup_python() {
  python_requires=(python pip pyenv)
  for i in "${python_requires[@]}"; do
    if ! utils.cmd_exists $i; then
      echo "$(tput setaf 2)Python dependencies missing.. Skipping python setup$(tput sgr0)"
      return
    fi
  done

  echo "Setting up python"
  eval "$(pyenv init -)"

  pyenv install 2.7.11 --skip-existing
  [[ !  $(pyenv virtualenvs --bare) =~ "neovim2" ]] && pyenv virtualenv 2.7.11 neovim2

  pyenv activate neovim2
  pip install $python2_req
  python2_path=$(pyenv which python)
  pyenv deactivate

  pyenv install 3.6.1 --skip-existing
  [[ !  $(pyenv virtualenvs --bare) =~ "neovim3" ]] && pyenv virtualenv 3.6.1 neovim3

  pyenv activate neovim3
  pip install $python3_req
  python3_path=$(pyenv which python)
  pyenv deactivate

  mkdir -p $HOME/.config/nvim
  cat <<EOF > $HOME/.config/nvim/python.local.vim
let g:python_host_prog = "$python2_path"
let g:python3_host_prog = "$python3_path"
EOF
}


_setup_ruby() {
  echo "Setting up Ruby"

  # eval "$(rbenv init -)"
  # rbenv install 2.4.0 --skip-existing

  # rbenv virtualenv 2.4.0 neovim

  # rbenv activate neovim
  # gem install neovim
  # rbenv deactivate

}

pkg.install() {
  _check_requires || exit $?
  _setup_python
  # _setup_ruby
}

pkg.link() {
  # Link into .config
  mkdir -p "$ELLIPSIS_HOME/.config"
  fs.link_rfile "$PKG_PATH" "$ELLIPSIS_HOME/.config/nvim"

  # Install Plugins
  echo "Installing nvim Plugins..."
  nvim +PlugInstall +qall --headless
  nvim +PlugClean! +qall --headless
}

pkg.unlink() {
  # Remove link in ~/.config
  rm -f "$ELLIPSIS_HOME/.config/nvim"

  # Remove links in the home folder
  hooks.unlink
}

pkg.pull() {
  # if [ "$(git.is_behind)" ]; then
    # git.pull-rebase

   setup_python
   setup_ruby

    # Install Plugins
    echo "Installing nvim Plugins..."
    nvim +PlugInstall +UpdateRemotePlugins +qall --headless

  # else
    # msg.bold "$PKG_NAME up-to-date."
  # fi
}

