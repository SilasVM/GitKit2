#!/usr/bin/env bash

## This script is called once after the instance is cloned by a KitClient.
## It runs in the clone of the instance in a KitClient.

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

INSTALL_INTO_SHELL_TEMPLATE_SH="$SCRIPT_DIR/install-into-shell_template.sh"
INSTALL_INTO_SHELL_SH="$SCRIPT_DIR/install-into-shell.sh"
SUB_SHIMS_DIR="$SCRIPT_DIR/sub-shims"
BASHRC="${HOME}/.bashrc"

install() {
    create-install-into-shell
    update-bashrc
    desplay-message
}

create-install-into-shell() {
    sed "s@replace-with-path-to-sub-shims@$SUB_SHIMS_DIR@" "$INSTALL_INTO_SHELL_TEMPLATE_SH" > "$INSTALL_INTO_SHELL_SH"
    chmod +x "$INSTALL_INTO_SHELL_SH"
}

update-bashrc() {
    # shellcheck disable=SC2016
    printf '# install git-shim\n' >> "$BASHRC"
    printf '%s%s%s\n' 'eval "$(' "$INSTALL_INTO_SHELL_SH" ')"'  >> "$BASHRC"
}

display-message() {
    printf '\n\nIMPORTANT: Close this terminal and start a new terminal to continue.\n\n'
}

install
