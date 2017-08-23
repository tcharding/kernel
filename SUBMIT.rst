Patch Submission
================

Customized for development on drivers/staging/

Before submitting patches we need to:

1. Each Patch:
   - does one thing only (no unnecessary code churn)
   - builds

2. Check headers: `make headers_check`
   
3. Check with checkpatch.pl: `checkpatch --strict --terse`
   
4. Check files touched with Smatch: `kchecker drivers/staging/modified.c`

5. Check with Sparse: `make -j9 C=2 M=drivers/staging/foo 2> sparse.out`

6. Apply and build on clean branch `apply-and-build.sh /path/to/patchset/`

7. Repeat step 6 on a different architecture (or cross-compile).


* Is this a fix for another patch? If so add a tag.

  .. code:: bash

            Fixes: 7676b72428e8 ("staging: ks7010: move comparison to right hand side")

You can generate the string by doing

.. code:: bash

          git show -s --abbrev-commit --abbrev=12 --pretty=format:"%h (\"%s\")%n" 7676b72
