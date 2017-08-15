#!/bin/bash
#
# git-am-dir.sh - apply patches

# Author: Tobin Harding <me@tobin.cc>
# Copyright (c) 2017 Tobin Harding

# The skeleton for this script and all the standard
# utilities are taken from The Rust Project

# Copyright (c) 2015 The Rust Project Developers

# Permission is hereby granted, free of charge, to any
# person obtaining a copy of this software and associated
# documentation files (the "Software"), to deal in the
# Software without restriction, including without
# limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software
# is furnished to do so, subject to the following
# conditions:

# The above copyright notice and this permission notice
# shall be included in all copies or substantial portions
# of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF
# ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
# TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
# SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
# IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.


set -u # Undefined variables are errors

main() {
    assert_cmds
    set_globals
    handle_command_line_args "$@"
    apply
}

set_globals() {
    # Environment sanity checks
    assert_nz "$HOME" "\$HOME is undefined"
    assert_nz "$0" "\$0 is undefined"

    script=${0##*/}             # script name
    nthreads=9
    patch_dir=""
}

handle_command_line_args () {
    if (( $# < 1 ))
    then
        echo "Usage: $0 <patch-dir>"
        exit 1
    fi

    patch_dir=$1
}

apply () {
    # check we are in a git repo
    ensure ls '.git' > /dev/null

    # apply each patches
    for file in $(ls $patch_dir)
    do
        # check file is not a cover letter
        [ ${file:0:4} == "0000" ] && continue

        # check for directories
        [ -d $file ] && continue
        
        _patch="$patch_dir/$file"
        ensure git apply --check $_patch

        ensure git am -3 < $_patch
    done

    echo ""
    echo "All patches applied and built successfully!"
}

assert_success() {
    err_msg="$1"

    if (( $? != 0 ))
    then
        echo $err_msg
        exit 1
    fi
}

# Standard utilities
#
#  Taken from: https://github.com/rust-lang/rustup.sh

say() {
    echo "$script: $1"
}

say_err() {
    say "$1" >&2
}

verbose_say() {
    if [ "$flag_verbose" = true ]; then
	say "$1"
    fi
}

err() {
    say "$1" >&2
    exit 1
}

need_cmd() {
    if ! command -v "$1" > /dev/null 2>&1
    then err "need '$1' (command not found)"
    fi
}

need_ok() {
    if [ $? != 0 ]; then err "$1"; fi
}

assert_nz() {
    if [ -z "$1" ]; then err "assert_nz $2"; fi
}

# Run a command that should never fail. If the command fails execution
# will immediately terminate with an error showing the failing
# command.
ensure() {
    "$@"
    need_ok "command failed: $*"
}

# This is just for indicating that commands' results are being
# intentionally ignored. Usually, because it's being executed
# as part of error handling.
ignore() {
    run "$@"
}

# Runs a command and prints it to stderr if it fails.
run() {
    "$@"
    local _retval=$?
    if [ $_retval != 0 ]; then
	say_err "command failed: $*"
    fi
    return $_retval
}

# Prints the absolute path of a directory to stdout
abs_path() {
    local _path="$1"
    # Unset CDPATH because it causes havok: it makes the destination unpredictable
    # and triggers 'cd' to print the path to stdout. Route `cd`'s output to /dev/null
    # for good measure.
    (unset CDPATH && cd "$_path" > /dev/null && pwd)
}

assert_cmds() {
    need_cmd ls
    need_cmd git
    need_cmd make
}

#
# Run main
#

main "$@"

