#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

export TARGET_ORG="${1}"
export PROJ_DIR="${SCRIPT_DIR}"
export REPO_DIR="${SCRIPT_DIR}/repository"
export GIT_DIR="${SCRIPT_DIR}/repository/.git"
export KIT_DIR="${SCRIPT_DIR}/repository/.kit"


TESTING=false
export TESTING

if [ "${TESTING}" = "true" ] ; then
    set -x
    TARGET_REPO=https://github.com/HFOSSedu/TestKit.git
    TARGET_COMMIT=b058258daac4a6934e73f5bee796444d1f8c0e21
    gh() {
        if [ "$1"="repo" ] ; then
            "$(which gh)" "$@"
        fi
    }
    export -f gh
else
    TARGET_REPO="https://github.com/DickinsonCollege/FarmData2.git"
    TARGET_COMMIT="d622e8d6d71e27890c73e2428e6dcf9d44ca606e"
fi

export TARGET_REPO
export TARGET_COMMIT

deploy() {
    clone "$TARGET_REPO"
    identify-as "kit" "kit@example.com"
    remove-remote origin
    switch-to main
    reset-to-commit "$TARGET_COMMIT"
    create-remote
    install-features
    commit
    push
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
