#!/usr/bin/env bash
#
# lugoues/nvim ellipsis package

# Pull git repo.
git.pull-rebase() {
    pkg.set_globals "${1:-$PKG_NAME}"
    msg.bold "updating $PKG_NAME"
    git pull --rebase
}

git.remote_branch() {
  git rev-parse --abbrev-ref "@{u}"
}

git.behind() {
  git rev-list "HEAD...$(git.remote_branch)" --count
}

git.is_behind() {
  [ "$(git.behind)" -gt 0 ]
}

pkg.install() {
  if ! utils.cmd_exists nvim; then
    log.fail "Unmet dependency 'nvim'"
    return 1
  fi
}

pkg.link() {
  # Link into .config
  mkdir -p "$ELLIPSIS_HOME/.config"
  fs.link_rfile "$PKG_PATH" "$ELLIPSIS_HOME/.config/nvim"

  # Install Plugins
  echo "Installing nvim Plugins..."
  nvim +PlugInstall +qall --headless
}

pkg.unlink() {
  # Remove link in ~/.config
  rm -f "$ELLIPSIS_HOME/.config/nvim"

  # Remove links in the home folder
  hooks.unlink
}

pkg.pull() {
  if [ "$(git.is_behind)" ]; then
    git.pull-rebase

    # Install Plugins
    echo "Installing nvim Plugins..."
    nvim +PlugInstall +qall --headless
  else
    msg.bold "$PKG_NAME up-to-date."
  fi
}
