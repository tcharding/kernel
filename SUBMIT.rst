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


     
