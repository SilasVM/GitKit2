#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

function main() {
    save-upstream-location-in-instance
}

function save-upstream-location-in-instance() {
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

function save-upstream-location() {
    write-upstream-location "$1"
    commit-and-push-upstream-location
}

function write-upstream-location() {
    echo "$1" > "$(get-upstream-location-file)"
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
