#!/usr/bin/env bash
#
# lugoues/nvim ellipsis package

requires=(nvim)

# Pull git repo.
git.pull-rebase() {
  pkg.set_globals "${1:-$PKG_NAME}"
  msg.bold "updating $PKG_NAME"
  git pull --rebase
}

_check_requires() {
  echo "$(tput setaf 2)Checking dependencies...$(tput sgr0)"
  for i in "${requires[@]}"; do
    if ! utils.cmd_exists $i; then
      log.fail "Unmet dependency '$i'"
      return 1
    fi
  done
}

pkg.link() {
  # Link into .config
  mkdir -p "$ELLIPSIS_HOME/.config"
  fs.link_rfile "$PKG_PATH/nvim" "$ELLIPSIS_HOME/.config/nvim"

  # Install Plugins
  # echo "Installing nvim Plugins..."
  # nvim +PlugInstall +qall --headless
  # nvim +PlugClean! +qall --headless
}

pkg.unlink() {
  # Remove link in ~/.config
  rm -f "$ELLIPSIS_HOME/.config/nvim"

  # Remove links in the home folder
  hooks.unlink
}

# pkg.pull() {
#   # if [ "$(git.is_behind)" ]; then
#   # git.pull-rebase

#   # Install Plugins
#   #  echo "Installing nvim Plugins..."
#   # nvim +PlugInstall +UpdateRemotePlugins +qall --headless

#   # else
#   # msg.bold "$PKG_NAME up-to-date."
#   # fi
# }
