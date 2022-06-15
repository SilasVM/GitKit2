#!/bin/bash

## This script is called after the new instance has been created and
## initialiazed. It runs in the local clone of the instance.

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

source "${SCRIPT_DIR}/upstream-location.sh"

function main() {
    save-upstream-location "$(get-upstream-location)"
}

function get-upstream-location() {
    get-origin-location
}

function get-origin-lcoation() {
    convert-url-to-org-repo "$(get-origin-url)"
}

function get-origin-url() {
    git remote get-url origin
}

function convert-url-to-org-repo() {
    url="$1"
    if [[ "$url" =~ ^git.* ]] ; then
        convert-git-url-to-org-repo "$url"
    else
        convert-http-url-to-org-repo "$url"
    fi
}

function convert-git-url-to-org-repo() {
    url="$1"
    url="$(remove-prefix-to-first-colon "$url")"
    url="$(remove-suffix-dot-git "$url")"
    echo "$url"
}

function convert-http-url-to-org-repo() {
    url="$1"
    url="$(remove-prefix-http "$url")"
    url="$(remove-suffix-dot-git "$url")"
    echo "$url"
}

function remove-prefix-to-first-colon() {
    echo "${1#*:}"
}

function remove-suffix-dot-git() {
    echo "${1%.git}"
}

function remove-prefix-http() {
    echo "${"${url#*//}"#*/}"
}

function get-upstream-location-file() {
    echo "$SCRIPT_DIR/upstream-location.txt"
}

function commit-and-push-upstream-location() {
    git add "$(get-upstream-location-file)"
    git commit -m "build(kit): add upstream location"
    git push
}

main
