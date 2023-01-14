#!/usr/bin/env bash

## This script is called once after the instance is cloned by a KitClient.
## It runs in the clone of the instance in a KitClient.

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
PROJECT_DIR="$(git rev-parse --show-toplevel)"

echo "$SCRIPT_DIR/prevent-merge-into-self.sh" >> "$SCRIPT_DIR/../8-git-shim/sub-shims/pre-merge"
chmod +x "$SCRIPT_DIR/../8-git-shim/sub-shims/pre-merge"
