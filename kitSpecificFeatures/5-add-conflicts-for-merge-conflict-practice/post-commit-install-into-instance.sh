#!/usr/bin/env bash

cd "${REPO_DIR}" || exit 1

set -e

git switch merge-conflict-practice
git rebase main
git switch main
