#!/usr/bin/env bash

## This script is called once after the instance is cloned by a KitClient.
## It runs in the clone of the instance in a KitClient.

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

PATH_TO_SUB_SHIMS="$SCRIPT_DIR/sub-shims"

sed "s@replace-with-path-to-sub-shims@$PATH_TO_SUB_SHIMS@" "$SCRIPT_DIR/install-into-shell_template.sh" > "$SCRIPT_DIR/install-into-shell.sh"
chmod +x "$SCRIPT_DIR/install-into-shell.sh"

printf '# install git-shim\n' >> "${HOME}/.bashrc"
printf '%s%s%s\n' 'eval "$(' "$SCRIPT_DIR/install-into-shell.sh" ')"'  >> "${HOME}/.bashrc"

bash --login
