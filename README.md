Soda Token 2.0.10-1
==============

What is Soda Token?
----------------
A globally accessible and anonymous blockchain for censorship-resistant communications and economic activity.

1. Get dependencies:
    1. Debian
    ```{r, engine='bash'}
    sudo apt-get install \
          build-essential pkg-config libc6-dev m4 g++-multilib \
          autoconf libtool ncurses-dev unzip git python \
          zlib1g-dev wget bsdmainutils automake
    ```
    2. Centos:
    ```{r, engine='bash')
    sudo yum install epel-release
    sudo yum update
    sudo yum groupinstall 'Development Tools'
    sudo yum install git cmake3 wget
    ```
    3. Windows
    ```{r, engine='bash'}
    sudo apt-get install \
        build-essential pkg-config libc6-dev m4 g++-multilib \
        autoconf libtool ncurses-dev unzip git python \
        zlib1g-dev wget bsdmainutils automake mingw-w64
    ```
    4. Arm
    ```{r, engine='bash'}
    sudo apt-get install \
        build-essential pkg-config libc6-dev m4 g++-multilib-arm-linux-gnueabihf \
        autoconf libtool ncurses-dev unzip git python \
        zlib1g-dev wget bsdmainutils automake
    ```

* Install for linux
```{r, engine='bash'}

# Get source code
git clone  https://github.com/BinaryOmen/SodaToken.git
cd SodaToken
chmod +x fetch-params.sh build.sh

# Build
./zcutil/build.sh -j$(nproc)
# fetch key
./zcutil/fetch-params.sh
# Run
./src/sodatokend
```

* Install for Windows (Cross-Compiled, building on Windows is not supported yet)

```
./zcutil/build-win.sh -j$(nproc)
```

* Install for aarch64(ARM64)

```
mkdir -p ~/bin
cd ~/bin
ln -s /usr/bin/ar aarch64-unknown-linux-gnu-ar
ln -s /usr/bin/g++ aarch64-unknown-linux-gnu-g++
ln -s /usr/bin/gcc aarch64-unknown-linux-gnu-gcc
ln -s /usr/bin/nm aarch64-unknown-linux-gnu-nm
ln -s /usr/bin/ranlib aarch64-unknown-linux-gnu-ranlib
ln -s /usr/bin/strip aarch64-unknown-linux-gnu-strip
PATH=$PATH:~/bin
cd ~/sodatoken/
./zcutil.build-arm.sh --disable-rust -j$(nproc)
```
Instructions to redeem pre block 100 $SODA
-------------
1. Linux:
Copy and paste your wallet.dat from ~/.zclassic/ to ~/.sodatoken. That's it!

2. Windows:
Copy and paste your wallet.dat from %APPDATA%/Zclassic/ to %APPDATA%/Soda Token. That's it!

About
--------------

[Soda Token](https://sodatoken.org/) is a platform for secure communications and for deniable economic activity.
Soda Token is an evolution of the Zclassic codebase aimed at primarily enabling intriniscally secure communications and
resilient networking.

This software is the Soda Token client. It downloads and stores the entire history
of Soda Token transactions; depending on the speed of your computer and network
connection, the synchronization process could take a day or more once the
blockchain has reached a significant size.

Security Warnings
-----------------

See important security warnings in
[doc/security-warnings.md](doc/security-warnings.md).

**Soda Token is unfinished and highly experimental.** Use at your own risk.

Where do I begin?
-----------------
* The easiest way to get started is to download one of the available graphical wallets from [sodatoken.org](https://sodatoken.org)

### Need Help?

* Many guides and tutorials are available at [Soda Token Discord](https://discord.gg/BGcRm)
  for help and more information.

### Want to participate in development?

* Code review is welcome!

Participation in the Soda Token project is subject to a
[Code of Conduct](code_of_conduct.md).

Building
--------

Build Soda Token along with most dependencies from source by running
./zcutil/build.sh for Linux.
./zcutil/build-win.sh for Windows
./zcutil/build-mac.sh for MacOS.

License
-------

For license information see the file [COPYING](COPYING).
