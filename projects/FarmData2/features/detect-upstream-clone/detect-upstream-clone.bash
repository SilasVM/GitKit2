#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH-SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";

function main() {
    detect-upstream-clone
}

function detect-upstream-clone() {
    upstream="$(get-upstream-location)"
    origin="$(get-origin-location)"
    if [[ "$origin" == "$upstream" ]] ; then
        display-error-message
    fi
}

function get-upstream-location() {
    cat "$(get-upstream-location-file)"
}

function get-upstream-location-file() {
        echo "$SCRIPT_DIR/upstream-location.txt"
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

function display-error-message() {
    echo "*********************************************************************"
    printf "\xF0\x9F\x98\xBA Meow, Kitty here!\n"
    echo
    echo "Oops, I think you have cloned the upstream repository instead of your"
    echo "fork. But don't worry. You can fix it!"
    echo
    echo "1. Delete your local repository."
    echo "2. Navigate to your fork on GitHub and copy its clone URL."
    echo "3. Clone your fork using its clone URL."
    echo "*********************************************************************"
}

main
