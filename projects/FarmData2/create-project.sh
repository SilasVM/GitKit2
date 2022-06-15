#!/bin/bash

create-instance() {
    KIT_TARGET="${1}"
    clone https://github.com/DickinsonCollege/FarmData2.git
    reset-to-commit main d622e8d6d71e27890c73e2428e6dcf9d44ca606e
    create-github-repository "${KIT_TARGET}/GitKit-FarmData2"
    install-kit
    commit-and-push
}

clone() {
    git clone "${1}" repository
    cd repository
}

reset-to-commit() {
    git switch "${1}"
    git reset --hard "${2}"
}

create-github-repository() {
    git remote remove origin
    gh repo create "${1}" --public
}

install-kit() {
    mkdir -p .kit
    cp -R ../features ./kit
    for feat in .kit/features/* ; do
        "${feat}/install-into-instance.sh"
    done
}

commit-and-push() {
    git add .
    git commit -m "install kit"
    git push --all --tags
}

create-instance "$@"
