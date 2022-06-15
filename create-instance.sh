#!/bin/bash

create-instance() {
    for project in ./projects/* ; do
        (cd "${project}" && create-project.sh)
    done
}

create-instance "$@"
