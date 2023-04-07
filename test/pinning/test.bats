#!/usr/bin/env bats

run_system_under_test() {
    ./deploy.sh
}

setup() {
    load_libraries
    ensure_temp_dir_exists
    define_trace_file
    define_gold_file
}

load_libraries() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    load 'test_helper/bats-file/load'
}

ensure_temp_dir_exists() {
    TEMP_DIR=.temp/test/pinning
    mkdir -p $TEMP_DIR
}

define_trace_file() {
    TRACE_FILE=$TEMP_DIR/trace.txt
}

define_gold_file() {
    GOLD_FILE=test/pinning/gold.raw
}

@test "clones given repo" {
    gh() {
        echo "mocked: gh $@"
    }
    git() {
        echo "mocked: git $@"
    }
    sleep() {
        echo "mocked: sleep $@"
    }
    export -f gh
    export -f git
    export -f sleep

    run_system_under_test > $TRACE_FILE
    diff $TRACE_FILE $GOLD_FILE >&3
    if $? ; then
        echo "For a side-by-side, try " >&3
        echo "vimdiff $TRACE_FILE $GOLD_FILE" >&3
    fi
}
