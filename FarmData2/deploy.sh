#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

export TARGET_ORG="${1}"
export PROJ_DIR="${SCRIPT_DIR}"
export REPO_DIR="${SCRIPT_DIR}/repository"
export GIT_DIR="${SCRIPT_DIR}/repository/.git"
export KIT_DIR="${SCRIPT_DIR}/repository/.kit"

deploy() {
    clone
    create-remote
    install-features
    commit
    push
}

clone() {
    (
        mkdir -p "${REPO_DIR}"
        cd "${REPO_DIR}"
        git clone https://github.com/DickinsonCollege/FarmData2.git .

        # We must checkout each branch we want to keep.
        # We reset to a specific commit so the kit is repeatable.
        git switch main
        git reset --hard d622e8d6d71e27890c73e2428e6dcf9d44ca606e
        git remote remove origin
    )
}

create-remote() {
    (
        cd "${REPO_DIR}"
        local org="$(get-org-name "${TARGET_ORG}")"
        local proj="$(get-project-name)"
        gh repo create "${org}/${KIT_PROJECT_PREFIX}${proj}" --public
        git remote add origin "https://${GH_TOKEN}@github.com/${org}/${KIT_PROJECT_PREFIX}${proj}"
    )
}

get-org-name() {
    local n="$1"
    n="${n##*github.com/}"
    n="${n%.git}"
    echo "$n"
}

get-project-name() {
    basename "${PROJ_DIR}"
}

install-features() {
    (
        mkdir -p "${KIT_DIR}"
        cp -R "${PROJ_DIR}"/features "${KIT_DIR}"

        for f in "${KIT_DIR}"/features/* ; do
        (
            cd "${f}"
            test ! -e ./install-into-instance.sh || ./install-into-instance.sh
        )
        done
    )
}

commit() {
    (
        cd "${REPO_DIR}"
        git add .
        git config user.email "kit@example.com"
        git config user.name "kit"
        git commit -m "chore(kit): deploy"
    )
}

push() {
    (
        cd "${REPO_DIR}"
        git push --all
        git push --tags
    )
}

deploy
