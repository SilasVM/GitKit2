#!/usr/bin/env bash

## This script is called after the new instance has been created and
## initialiazed. It runs in the local clone of the instance.

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )"

set -e

cp -r "$SCRIPT_DIR/.devcontainer" "$REPO_DIR"
chmod +x "$REPO_DIR/.devcontainer/install-gitkit-client.sh"
