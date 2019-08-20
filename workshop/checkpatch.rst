============================
Checkpatch your way to glory
============================

This project will use one of the kernel's intree tools to find a few things to
work on.  ``scripts/checkpatch.pl`` is a static analysis tool useful for finding
code that may need patching.  It is not the only intree tool, it is not even the
only intree static analysis tool.  It is however very useful and if you plan on
sending any patches to LKML you should be very familiar with it.  By *very* I
mean you should be running it on every patch you send to LKML.  Trust me on this
one, it will save you a lot of embarrassment.

The aim of this project is, like all the others, to get a three patch series
together so we can submit it to LKML.  Here we will be focusing on the
development process required to patch the kernel more than the exact changes.
By design, we are not trying to do complex changes, just some small simple
patches to get your feet wet.

First off, you may like to define a shell alias.  Then run checkpatch against
various directories in ``drivers/staging`` until you find one that looks
interesting i.e., achievable.

.. code:: bash

        export KTREE=/path/to/staging
	alias checkpatch="$KTREE/scripts/checkpatch.pl"
        cd $KTREE/drivers/staging
	checkpatch --terse --strict --show-types --file foo/*.[ch]


What are we fixing
==================

The aim is to put together three patches i.e., do three commits that can then be
tied together as a series.  The kernel mantra is 'fix one thing per patch' so we
can fix one type of checkpatch warning/error/check per patch.  Typically you
will do *all* of the errors of a single type in the same patch.  If this seems
like too much work you *could* just do one of them or you could find a driver
with a manageable number of errors.

So, for example

.. code:: bash
          
	checkpatch --terse --strict --show-types --file most/*.[ch]
	most/core.c:55: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
	most/core.c:63: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
	most/core.c:306: WARNING:LONG_LINE: line over 80 characters
	most/core.c:345: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 	'c->iface->interface != ITYPE_MEDIALB_DIM2'
        ...

We could look at all the lines indicated by CHECK:UNNECESSARY_PARENTHESES and
check if the parentheses are really unnecessary.  By the way, this check
requires some knowledge of kernel coding style, in this case the typical rule is
to **not** make the code harder to understand.  As Dan Carpenter explains in
``./email-from-dan`` doing code changes just to quieten a tool is not what you
want to do, we want to make sure we are improving the code as well as clearing
the warning.

The kernel coding style is documented in ``$KTREE/Documentation/process/coding-style.rst``.

Go ahead, find some code with bad smells and see if you can clean it up.  Make
sure you run checkpatch again after you make a change to see if the warning is cleared.

You probably want to create a new branch to work on.

When committing each change please follow the guidelines in Section 2 'Describe
your changes' of ``$KTREE/Documentation/process/submitting-patches.rst``.

Once you have three commits on your branch you are ready to create and submit
the series.  Please see ``patch-series.rst``.
