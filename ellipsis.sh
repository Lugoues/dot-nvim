#!/usr/bin/env bash
#
# lugoues/nvim ellipsis package

# The following hooks can be defined to customize behavior of your package:
#pkg.install() {
#  fs.link_rfile $HOME/.config
#}

# pkg.push() {
#     git.push
# }

# pkg.pull() {
#     git.pull
# }

# pkg.installed() {
#     git.status
# }
#
# pkg.status() {
#     git.diffstat
# }

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
}

pkg.unlink() {
  # Remove link in ~/.config
  rm -f "$ELLIPSIS_HOME/.config/nvim"

  # Remove links in the home folder
  hooks.unlink
}
