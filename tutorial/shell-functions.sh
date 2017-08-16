#!/bin/bash
#
# Miscellaneous kernel shell functions.

# Build ks7010 device driver.
build-ks7010() {
    local dir='drivers/staging/ks7010'

    rm -f $dir/*.o
    rm -f $dir/*.ko
    rm -f $dir/*.mod.c
    
    make -j9 EXTRA-CFLAGS=-W M=$dir
}


# Clean up kernel build files.
k-clean() {
    rm *.o
    rm *.ko
    rm *.mod.c
    clean-dir
}

# Clean directory of autosaves (emacs users).
function clean-dir {
    ls *~ 2> /dev/null
    if (( $? == 0 ))
    then
	rm -f *~ 2> /dev/null
    fi
    ls \#*\# 2> /dev/null
    if (( $? == 0 ))
    then
	rm -f \#*\# 2> /dev/null
    fi

    return 0
}
