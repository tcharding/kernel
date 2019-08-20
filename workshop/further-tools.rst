=============
Further Tools
=============

The kernel tree contains a number other tools for checking C code.  Of interest
when trying to find things to work on are the following

- Sparse - semantic checker for C programs.
- Coccinelle - a tool for pattern matching and text transformation.
- Spatch - a static analysis tool, now part of the Coccinelle project.
  
Documentation can be found in ``Documentation/dev-tools``.

If checkpatch.pl is way too easy for you you may enjoy playing with these tools
and running them against code in ``drivers/staging`` to see if you can locate code
that could be improved.

Until you have done a decent number of patches to the kernel please do confine
yourself to ``drivers/staging``.  Not all developers appreciate newbies messing
around with code they maintain.  ``drivers/staging`` is *the* place to learn the
basics of kernel development, people will be very patient and welcoming of you
there.

Once you have a few patches queued up see ``./patch-series.rst`` if you need to.
