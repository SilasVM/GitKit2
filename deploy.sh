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

        features=($(yq '.pre-install-features' config.yaml))
        for i in "${features[@]}" ; do
        (
            test ! -e "./$i" || "./$i"

        )
        done
    )
}

install-features() {
    (
        mkdir -p "${KIT_DIR}"
        cp -R features "${KIT_DIR}"
        
        features=($(yq '.install-features' config.yaml))
        for i in "${features[@]}" ; do
        (
            test ! -e "./$i" || "./$i"

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
        features=($(yq '.post-commit-install-features' config.yaml))
        for i in "${features[@]}" ; do
        (
            test ! -e "./$i" || "./$i"

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

        features=($(yq '.post-push-install-features' config.yaml))
        for i in "${features[@]}" ; do
        (
            test ! -e "./$i" || "./$i"

        )
        done
    )
}

deploy
