===========================================================
Hacking Device Drivers - How to get into kernel development
===========================================================

This tutorial is presented as two tracks. This was done in order to cater to differing levels of
ability and experience. Please feel free to choose whichever track appeals to you as most enjoyable.

Prerequisites
-------------

This tutorial assumes that you have submitted a single kernel patch to the Linux kernel device
driver mailing list. If you have not done this you may find it useful to work through the process of
doing so. Here is a quick list of what you need;

- To have cloned Greg Kroah-Hartman's staging tree.
- To have configured the kernel to build staging drivers.
- Have a kernel development environment set up (editor, mail client, git). 
- Have subscribed to the Linux kernel device driver mailing list.

These steps are briefly outlined here_ and more thoroughly in this blog_ post and
on kernelnewbies_.

.. _here: ../2.First-patch.rst
.. _blog: http://tobin.cc/blog/kernel-dev-1
.. _kernelnewbies: https://kernelnewbies.org/FirstKernelPatch

Track One_
---------

.. _One: track-one.rst

This track builds on the prerequisites and aims to be easily achievable within the two hour time
slot. If you are most interested in the process of kernel development without being bothered, at this
stage, in exactly what you are working on then choose this track. This is also the easier of the two.

- More structured, easier.
- Based on an old kernel version (v4.9).
- Work on ks7010 Wi-Fi driver.
- Should easily complete within 2 hours.

Track Two_
---------

.. _Two: track-two.rst

This track has less hand holding, you do actual real work that can be submitted to the
kernel. Choose this track if you like to explore more, you are more experienced or you don't mind
whether you finish in 2 hours or not.

- Less structured.
- Harder (more to figure out for yourself).
- Based on the current staging tree. 
- Work on which ever driver you please.
- May or may not complete within the two hours.


**If you choose Track One you can always complete Track Two later if it amuses you.**

