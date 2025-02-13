#!/bin/bash

function populate_go() {
    FILE=$1
    cat <<EOF > "$FILE"
package main

import "fmt"

func main() {
	fmt.Println("Hello World!")
}
EOF
}

function handle_go() {
    echo "Handling Go language" >&2

    TARGET_DIR=$1
    DIRECTORY_CREATED=$2

    # If DIRECTORY_CREATED is 1, the directory already exists
    # As we don't want to mess with existing directories,
    # we don't create create main.go or run go mod init
    if [ "$DIRECTORY_CREATED" -eq 0 ]; then
        FILE_OPEN="$TARGET_DIR/main.go"
        touch "$FILE_OPEN"
        populate_go "$FILE_OPEN"
        cd "$TARGET_DIR" && go mod init && cd "$_PWD" || exit
    fi

    echo "$FILE_OPEN"
}
