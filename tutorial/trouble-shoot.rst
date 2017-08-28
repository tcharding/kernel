Trouble shooting
================

Kernel Build Errors
-------------------

- If you get build errors referring to ssl, you may need to install the ssl development library.

    On Ubuntu: libssl-dev

- On Debian based distro's, if you get a build error containing

    needed by 'certs/x509_certificate_list'

  You may need to set your config to

    CONFIG_SYSTEM_TRUSTED_KEYRING=n
    # CONFIG_SYSTEM_TRUSTED_KEYS=""

- If you want to start the build process fresh

2. Run `make mrproper` (this removes .config)
3. Create .config (either from a backup or from a running config)
4. Run `make yes "" | make oldconfig`
5. Run `make`

Git
---

- If you get an error when using `git send-email` you may need to install the `git-email` package. See

    https://burzalodowa.wordpress.com/2013/10/05/how-to-send-patches-with-git-send-email/

