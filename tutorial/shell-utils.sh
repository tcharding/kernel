#
# Miscellaneous kernel shell functions and aliases.
#

# View git index (see below for function).
alias l=git-log-abbrev

# Patch of working directory changes.
alias wp=git diff --color=always | less

# Patch of previous commits (see below for function).
alias lp=git-log-patch

# Set -jN flag for your machine. N = num cores (or hypethreads) + 1
alias k-build=make -j9 EXTRA-CFLAGS=-W >/dev/null

# Build ks7010 device driver, must be run from kernel tree root dir.
function build-ks7010() {
    local dir='drivers/staging/ks7010'

    rm -f $dir/*.o
    rm -f $dir/*.ko
    rm -f $dir/*.mod.c
    
    make -j9 EXTRA-CFLAGS=-W M=$dir
}


# Clean up kernel build files.
function k-clean() {
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

# git log
function git-log-abbrev () {
    # number of commits from index to view, default 1
    local N=${1:-20} 

    git log -$N --pretty=oneline --abbrev-commit --reverse
}

# git patch view
function git-log-patch() {
    local commit
    
    if (( $# < 1 ))
    then
        commit="HEAD~"          # default to last commit
    else
        commit="$1"
    fi
    
    git log --color=always --patch --reverse "${commit}".. | less 
}
