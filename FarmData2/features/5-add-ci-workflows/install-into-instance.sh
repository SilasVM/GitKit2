#!/usr/bin/env bash

## This script is called after the new instance has been created and
## initialiazed. It runs in the local clone of the instance.

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )"

set -e

github_dir="${REPO_DIR}/.github"
mkdir -p "$github_dir"
cp -r "$SCRIPT_DIR/workflows" "$github_dir"
