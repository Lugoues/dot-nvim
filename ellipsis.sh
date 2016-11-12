#!/usr/bin/env bash
#
# lugoues/nvim ellipsis package

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
  git.pull

  # Install Plugins
  echo "Installing nvim Plugins..."
  nvim +PlugInstall +qall --headless
}
