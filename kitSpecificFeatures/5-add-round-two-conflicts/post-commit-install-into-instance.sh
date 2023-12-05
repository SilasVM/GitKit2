#!/usr/bin/env bash

cd "${REPO_DIR}" || exit 1

set -e

git switch add-round-two-conflicts
git rebase main
git switch main
