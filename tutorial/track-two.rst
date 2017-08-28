=========
Track Two
=========

In this track we will craft a small patch series that may be submitted to the kernel. This track is
purposefully open and is meant to be a guide only. If you would prefer a more concrete task see
Track One.

- Base your series off of the staging-next branch of GregKH's staging tree.

- Pick a driver to work on from `drivers/staging/` (see ../3.First-patch-series.rst for tips).

- Run checkpatch on 'your' driver

  .. code:: bash

     scripts/checkpatch.pl --terse --strict --show-types drivers/staging/FOO/*.{ch}

  If you'd like something more challenging you may like to try `Sparse` errors.

  .. code:: bash

     make C=2 M=drivers/staging/FOO
            
- Pick three warnings that you feel you can fix. You should be sure to understand fully the code
  changes you are making. Don't bother with 'line over 80' warnings. If you are going to do
  white space fixes be sure to get it correct, look at other code and rerun checkpatch on your
  changes to verify you cleared the warning. Remember however that `checkpatch.pl` is just a dumb
  script, understand the reason you are getting the warning before you fix it.

- Fix each warning type (or Sparse error) in a single patch. Fix all instances of the warning type
  within the driver. Each commit will need a thorough commit log. See section 2 of 

  .. code::

  	Documentation/process/submitting-patches.rst

  The importance of a correct and thorough commit log cannot be overstated. The kernel git log has
  it's own style. It takes a bit of getting used to, kernel commit logs are one of those things that
  you can refine for a very long time. Putting in the effort to learn how to write a good commit log
  is essential if you wish to progress further as a kernel developer.

- Once you have three commits in your index, verify your changes are correct.

  .. code:: bash

	    git log --color=always --patch --reverse HEAD~~~.. | less 
    
  If you need to fix something up you can rebase

  .. code:: bash

  	    git rebase -i HEAD~~~

- Verify your patches **all** apply and build cleanly on top of the `staging-next` branch. You can do
  this manually, you can hack a quick shell script to do it, or you can use `../apply-and-build.sh`.

- Output a correctly linked patch set ready for submission

  .. code:: bash

     git format-patch -3 -o path/to/patch/dir --cover-letter

- Ascertain the recipients of your patch set (check the TODO within the driver if present)

  .. code:: bash

     scripts/get_maintainer.pl path/to/patch/dir/*.patch  

- Write the cover letter. This can be anything from an exhaustive explanation of what the series
  does to a brief few line sentence. For a simple series like this, you may like to lean towards the
  latter.

- [Email the series to yourself]

  .. code:: bash

     git send-email --to='me@gmail.com' path/to/patch/dir/*.patch

- Submit the series for real. If you add the `To:` and `Cc:` headers to the cover letter then
  the following command does what you need

  .. code:: bash

     git send-email --to-cover --cc-cover path/to/patch/dir/*.patch

            
**Profit!**
