#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )"

DEFAULT_PREFIX=GitKit-
export KIT_PROJECT_PREFIX="${KIT_PROJECT_PREFIX:-${DEFAULT_PREFIX}}"
export TARGET_ORG="${1}"

export PROJ_DIR="${SCRIPT_DIR}"
export REPO_DIR="${SCRIPT_DIR}/repository"
export KIT_DIR="${SCRIPT_DIR}/repository/.kit"

TARGET_REPO="$(yq '.TARGET_REPO' config.yaml)"
TARGET_COMMIT="$(yq '.TARGET_COMMIT' config.yaml)"
export TARGET_REPO
export TARGET_COMMIT

deploy() {
    clone "$TARGET_REPO"
    identify-as "kit" "kit@example.com"
    remove-remote origin
    switch-to main
    reset-to-commit "$TARGET_COMMIT"
    create-remote
    pre-install-features
    install-features
    commit
    post-commit-install-features
    push
    post-push-install-features
}

clone() {
    (
        mkdir -p "${REPO_DIR}"
        cd "${REPO_DIR}"
        git clone "$1" .
    )
}

identify-as() {
    (
        cd "${REPO_DIR}"
        git config user.email "$2"
        git config user.name "$1"
    )
}

remove-remote() {
    git remote remove "$1"
}

switch-to() {
    (
        cd "${REPO_DIR}"
        git switch "$1"
    )
}

reset-to-commit() {
    (
        cd "${REPO_DIR}"
        git reset --hard "$1"
    )
}

create-remote() {
    (
        cd "${REPO_DIR}"
        local org
        org="$(get-org-name "${TARGET_ORG}")"
        local proj
        proj="$(get-project-name)"
        gh repo create "${org}/${KIT_PROJECT_PREFIX}${proj}" --public
        git remote add origin "https://${GH_TOKEN}@github.com/${org}/${KIT_PROJECT_PREFIX}${proj}"
    )
}

get-org-name() {
    local n
    n="$1"
    n="${n##*github.com/}"
    n="${n%.git}"
    echo "$n"
}

get-project-name() {
    basename "FarmData2"
}

pre-install-features() {
    (
        cp -R features "${KIT_DIR}"

        for f in features/* ; do
        (
            test ! -e "${f}/pre-install-into-instance.sh" || "${f}/pre-install-into-instance.sh"
        )
        done
    )
}

install-features() {
    (
        mkdir -p "${KIT_DIR}"
        cp -R features "${KIT_DIR}"
        
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
        git reset --soft "${TARGET_COMMIT}"
        git add .
        git commit -m "chore: install kit"
    )
}

post-commit-install-features() {
    (
        for f in "${KIT_DIR}"/features/* ; do
        (
            cd "${f}"
            test ! -e ./post-commit-install-into-instance.sh || ./post-commit-install-into-instance.sh
        )
        done
    )
}

push() {
    (
        cd "${REPO_DIR}"
        git push --all
        git push --tags
    )
}

post-push-install-features() {
    (
        cp -R kitSpecificFeatures "${KIT_DIR}"

        for f in "${KIT_DIR}"/kitSpecificFeatures/* ; do
        (
            cd "${f}"
            test ! -e ./post-push-install-into-instance.sh || ./post-push-install-into-instance.sh
        )
        done
    )
}

deploy
