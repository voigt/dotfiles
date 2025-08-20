#!/bin/bash

function handle_rust() {
    echo "Handling Rust language" >&2

    TARGET_DIR=$1
    DIRECTORY_CREATED=$2

    # If DIRECTORY_CREATED is 1, the directory already exists
    # As we don't want to mess with existing directories,
    # existing directories skip creating main.rs and running cargo init
    if [ "$DIRECTORY_CREATED" -eq 0 ]; then
        FILE_OPEN="$TARGET_DIR/src/main.rs"
        cd "$TARGET_DIR" && cargo init --bin && cd "$_PWD" || exit
    fi

    echo "$FILE_OPEN"
}
