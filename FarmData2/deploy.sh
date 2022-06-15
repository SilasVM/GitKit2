#!/bin/bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

export TARGET_URL="${1}"
export PROJ_DIR="${SCRIPT_DIR}"
export REPO_DIR="${SCRIPT_DIR}/repository"
export GIT_DIR="${SCRIPT_DIR}/repository/.git"
export KIT_DIR="${SCRIPT_DIR}/repository/.kit"
export GIT="git --git-dir \"${GIT_DIR}\""

deploy() {
    clone
    create-remote
    install-features
    push
}

clone() {
    exit-without-error-if-repository-exists
    clone-url https://github.com/DickinsonCollege/FarmData2.git
    reset-branch-to-commit main d622e8d6d71e27890c73e2428e6dcf9d44ca606e
    remove-origin-remote
}

exit-without-error-if-repository-exists() {
    if [[ -d "${GIT_DIR}" ]] ; then
        exit 0
    fi
}

clone-url() {
    git clone "$1" "${REPO_DIR}"
}

reset-branch-to-commit() {
    ${GIT} switch "$1"
    ${GIT} reset --hard "$2"
}

remove-origin-remote() {
    ${GIT} remote remove origin
}

create-remote() {
    local org="$(get-org-name "${TARGET_URL}")"
    local proj="$(get-project-name)"
    gh repo create "${org}/${KIT_PROJECT_PREFIX}${proj}"  --source "${REPO_DIR}" --public
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
    mkidr -p "${KIT_DIR}"
    cp -R "${PROJ_DIR}"/features "${KIT_DIR}"
    for f in "${KIT_DIR}"/features/* ; do
        "${f}"/install-into-instance.sh
    done
    ${GIT} add .
    ${GIT} commit -m "build(kit): install features"
}

push() {
    ${GIT} push --all --tags
}
