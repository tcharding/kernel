Cheat Sheet
===========

- Supply default answer for all prompted `make oldconfig` questions

  .. code:: bash

     yes "" | make oldconfig

- Kernel build command, N = Number of cores (or hypethreads) + 1

  .. code:: bash

     make -jN EXTRA-CFLAGS=-W >/dev/null

- Build the FOO module only

  .. code:: bash  

     make -jN EXTRA-CFLAGS=-W M=drivers/staging/FOO >/dev/null

- Checkpatch     

  .. code:: bash

     scripts/checkpatch.pl --terse --strict --show-types drivers/staging/FOO/*.{ch}

- Git view commits in patch format

  .. code:: bash

     git log --color=always --patch --reverse HEAD~~~.. | less

- Git format patch

  .. code:: bash

     git format-patch -3 -o path/to/patch/dir --cover-letter

- Git send email     

  .. code:: bash

     git send-email --to='me@gmail.com' path/to/patch/dir/*.patch
     git send-email --to-cover --cc-cover path/to/patch/dir/*.patch

