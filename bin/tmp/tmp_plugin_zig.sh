#!/bin/bash

function handle_zig() {
    echo "Handling Zig language" >&2

    TARGET_DIR=$1
    DIRECTORY_CREATED=$2

    # If DIRECTORY_CREATED is 1, the directory already exists
    # As we don't want to mess with existing directories,
    # we don't create create main.go or run go mod init
    if [ "$DIRECTORY_CREATED" -eq 0 ]; then
        FILE_OPEN="$TARGET_DIR/src/main.zig"
        cd "$TARGET_DIR" && zig init && cd "$_PWD" || exit
    fi

    echo "$FILE_OPEN"
}
