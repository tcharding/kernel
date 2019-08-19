=================
Probe and Release
=================

This project is based on an email I received from Dan Carpenter on LKML.  You
can read the full email in `./email-from-dan` and here is the paragraph that
inspired this project:

    Most of the time when you look at a new staging driver, then you do want
    to clean up the white space just because it's hard to look at
    non-standard code.  So that's the first step.  But then maybe start at
    the probe and release functions and clean it up.  Keep your eyes open
    to any other mistakes or bugs you see.  Write them down.  Then the
    ioctls.  Etc.  Look at the TODO too.


The output of this project is the same as the others, 3 or so patches that
we can submit to LKML as a patch series.  Since we are going to be messing with
more than just superficial changes in this project typically you would have
access to the hardware running the driver.  Clearly this is not feasible at the
conference but it is something to keep in mind.

The steps involved, as suggested above are

1. Pick a driver in `drivers/staging` that you like the look of.
2. Give it a quick look over for glaring style issues.  Like Dan says, this is
   mainly because reading code that has crazy style issues can be cumbersome.
   Fix stlye/whitespace issues first.
3. Have a look at the probe/release functions in more detail.
   - You could checkpatch these functions fully
   - Refactor
   - Ensure they do everything that is expected of a probe/release function for
     this type of driver.


That's it.  Pretty simple to describe, harder to do.  See if you can put
together a few patches that clearly improve the driver.  This is a good first
step in understanding the driver and going on to working on it more extensively.

Once you have a few patches queued up see `./patch-series.rst` if you need to.
