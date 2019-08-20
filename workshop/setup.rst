===============
Workshop set up
===============

Getting started
===============

We will be working off of Greg Kroah-Hartman's staging tree, specifically the
``staging-next`` branch.

If you already know how to checkout the ``staging-next`` branch of Greg's staging
tree feel free to skip ahead.

You will need a local copy of the Linux kernel tree.  If you have one already
you can jump down to 'Using a remote' below.


Cloning the tree
----------------

There is a git server running locally so we do not overload the conference Wi-Fi.

If you have not got a copy of the Linux kernel tree on your local machine then
you may clone it from the NUC attached to hotspot ``oss-kdev``.  If the whole room
does this then the NUC is going to choke so please consider just cloning with
``--depth=1``.  Also when testing I was only getting 4.7 MiB/s during clone (and
the whole tree is over 2 Gigabytes so please be patient.

- SSID: oss-kdev
- passphrase: oss-kdev-pass

.. code:: bash
                  
	git clone --depth=1 git://192.168.8.6/staging
        
This will clone Greg's tree with ``staging-next`` branch already checked out.  If
you cloned the tree some other way you can check out the branch with

.. code:: bash
                  
	git checkout -b staging-next --track origin/staging-next

Using a remote
--------------

If you have already have a local copy of the kernel tree on you can add the
following to your git config file

.. code:: bash

          # Greg's staging tree
          [remote "staging"]
          	url = git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
		fetch = +refs/heads/*:refs/remotes/staging/*
		pushurl = no_push	

Fetch and then checkout the ``staging-next`` branch

.. code:: bash

          git fetch staging
	  git checkout -b staging-next --track staging/staging-next


Building the staging drivers
============================

We will be working on staging drivers so you can go ahead and set the kernel
building now so as to save time.  Create a config file by doing the following

.. code:: bash

          make defconfig
          make localmodconfig
          make menuconfig
        
Then select *all* staging drivers under

Device Drivecs --> Staging

(If you already know which driver you want to hack on just select it.)

Set the kernel building now to save time later ``make -j9``.  Once the build
completes you can verify that staging drivers were built by ``cd``ing into
``drivers/staging`` and running

.. code:: bash

	find . -name *.o | wc -l
	318

        
You have now completed the setup, well done - let's have some fun.  Head back
over to the readme_ to continue.

.. _readme: ./README.rst

