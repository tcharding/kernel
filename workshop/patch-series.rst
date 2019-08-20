=======================
Creating a patch series
=======================

Once you have three (or more) commits on a branch (that was created off of
Greg's staging-next branch) you are ready to create a patch set.

When submitting patches to LKML it is expected that each patch in a series is
complete.  What this means is that with each patch applied (on top of the
previous one) the kernel builds and any testing you did passes.  A maintainer
may decide to take just the first [few] patches of your series.

Create a patch set with

.. code:: bash

	mkdir /tmp/patches
	git format-patch -o /tmp/patches -X --cover-letter

where `X` is the number of commits you want to include.       

Re-check
========

Re-check that you did not make any mistakes by running checkpatch against your
patches (you won't need the `--file` option this time).  (Please note;
checkpatch does not like parsing the cover-letter.)  Also make sure you build
the kernel for each patch of the series i.e., after each commit make sure the
kernel builds.  You may like to save the output from checkpatch without your
commits then diff against the output with the whole series applied, that way you
can verify you are not introducing any new errors.


Cover letter
============

Next you need to write a cover letter.  You cover letter is, as the name
suggests, an overview of the series.  It should briefly say whats in the series
and if there is anything unusual in the series.  Also outline any testing you
did, if you did not do any testing (assuming you didn't bring any hardware with
you that runs staging drivers) state this in the cover letter.  If this is your
first series to LKML you could explicitly state something like 'no testing done,
all patches build and checkpatch cleanly'.  Please make sure any claims you make
are true.

Optionally, at this stage, you can just set the To header to point to your own
email address then send the series to yourself as a test run using the command
below. If it all looks good you can then continue.

In the cover letter set the To, and CC headers appropriately.  One way I like to
address a patch is to send it to the maintainer[s] and CC everyone else
including mailing lists.  Using this method, and since we patched
drivers/staging/, the patches go 'To' Greg (and any other maintainer) and 'Cc'
to the driver development mailing list.  To find out who else should be included
run `scripts/get_maintainer.pl` on either the file you patched or the patch
itself.  You don't need to include everyone returned by that command but you
should at a minimum include the maintainers (sometimes listed as 'supporter')
and one mailing list.  It is nice to also CC a developer if they have a high
percentage of commits signed.  The kernel policy is to err on the side of CC'ing
too many people.  All kernel patches **must** be sent to a mailing list,
typically a subsystem mailing list.  CC'ing LKML main mailing list is common
practice but optional.

Feel free to CC me, Tobin C. Harding <me@tobin.cc> if you want.

Send
====

Ok, so now you have a bunch of patches and a cover letter.  Each patch
checkpatches cleanly and the kernel builds with each patch applied in series.
Well done, this is no small feat.  Open each patch in your editor and double
check that no mistakes have crept in, remember 'one thing per patch'.  The
kernel community is very strict on this and for good reason - reviewing is time
consuming, having random changes in a patch makes it harder to review.  Even
random whitespace changes should be put in their own patch not mixed into
another patch.

You can now send you patch series using `git send-email --to-cover --cc-cover /tmp/patches/*.patch`

If you have not done so already then now is a good time to read the email from
Dan Carpenter `./email-from-dan`.  Along with Greg, Dan is a very active
reviewer of staging patches.  Both these reviewers are extremely welcoming to
new comers and particularly patient.  They are happy to see you learn.  Please
be respectful of their time by being diligent and heeding any advice they
offer.  I learned a **lot** from the reviews by these two hackers and you can
too.

Congratulations, you have succeeded in completing the workshop.  Thank you once
again for attending, time is precious and I appreciate you choosing to spend
yours here.


Happy hacking!
