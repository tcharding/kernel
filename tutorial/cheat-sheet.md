Cheat Sheet
===========

- Supply default answer for all prompted `make oldconfig` questions

	yes "" | make oldconfig

- Kernel build command, N = Number of cores (or hypethreads) + 1

    make -jN EXTRA-CFLAGS=-W >/dev/null

- Build the FOO module only

    make -jN EXTRA-CFLAGS=-W M=drivers/staging/FOO >/dev/null
