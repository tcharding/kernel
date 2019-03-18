#!/bin/bash
#
# Run checkpatch over a directory of patches
# Exclude the cover-letter

base="/home/tobin/build/kdev/patches"
checkpatch='/home/tobin/build/kdev/linux/scripts/checkpatch.pl'

main() {
    local dir=$1
    local path="$base/$dir"

    if [ ! -d $path ]; then
	echo "dir not found: $path"
	exit 1
    fi

    for patch in $(ls $path); do
	sub=${patch:0:4}	# 0000-foo-bar.patch
	subv=${patch:3:4}	# v4-0000-foo-bar.patch
	if [ $sub == "0000" ] || [ $subv == "0000" ]; then
	    # echo "found cover-letter: $patch"
	    continue
	fi
	$checkpatch  --terse --strict $path/$patch
    done
}

#
# main script
#

if [[ $# < 1 ]]; then
    echo ""
    echo "Usage: cpt-dir <dir>"
    echo ""
    echo "	Expects <dir> to be in $base"
    echo ""
    exit 1
fi

main $@
