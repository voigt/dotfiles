#!/bin/bash

create_dir() {
    LANGUAGE=$1
    DIRECTORY=$2

    # if --mktemp is set, we want to use create_mktmp_dir
    if [ "$USE_MKTEMP" -eq 1 ]; then
        create_mktmp_dir "$LANGUAGE" "$DIRECTORY"
    else
        create_mkdir_dir "$LANGUAGE" "$DIRECTORY"
    fi
    exit $?
}

create_mkdir_dir() {
    LANG=$1
    NAME=$2
    DATE=$(date +%Y-%m-%d)

    if [ -z "$NAME" ]; then
        DIRSTRING="./${LANG}-${DATE}"
    else
        DIRSTRING="${NAME}"
    fi

    # REALPATH=$(realpath "$DIRSTRING")

    if [ -d "${DIRSTRING}" ]; then
        echo "Error: Directory ${DIRSTRING} already exists." >&2
        REALPATH=$(realpath "$DIRSTRING")
        echo "$REALPATH"
        return 1
    fi

    if confirm_creation; then
        echo "Creating directory: ${DIRSTRING}" >&2
        mkdir "${DIRSTRING}"
    fi

    # https://askubuntu.com/questions/893911/when-writing-a-bash-script-how-do-i-get-the-absolute-path-of-the-location-of-th
    REALPATH=$(realpath "$DIRSTRING")

    echo "$REALPATH"
}

create_mktmp_dir() {
    LANG=$1
    NAME=$2
    DATE=$(date +%Y-%m-%d-%H-%M-%S)

    # TODO: check max length
    PATTERN="${LANG}"

    # if $NAME is not empty, use it as part of the pattern
    if [ -n "$NAME" ]; then
        PATTERN="${LANG}-${NAME}"
    fi
    if [ "$USE_DATE" -eq 1 ]; then
        PATTERN="${PATTERN}-${DATE}"
    fi

    # ROOT_DIR="" # (just use what ever mktemp uses as default)
    ROOT_DIR=$(pwd)  # current directory
    # ROOT_DIR=$HOME                           # home directory
    # ROOT_DIR=/home/$USER/tmp                 # custom directory
    # ROOT_DIR=/home/$USER/go/src/github.com/  # git directory - make configurable?

    tmp_dir=$(mktemp -d -t "${PATTERN}" --tmpdir="$ROOT_DIR")

    echo "$tmp_dir"
}
