## vimconfig

** This vimrc is being rebooted. Work-In-Progress **

# Quick Start

Windows:

    > cd %USERPROFILE%
    > git clone https://github.com/djs/vimconfig.git
    > cd vimconfig
    > python install.py

UNIX:

    $ cd ~
    $ git clone https://github.com/djs/vimconfig.git
    $ cd vimconfig
    $ python install.py

# Problems

Vundle seems to be broken on Windows for executing updates. The cmd.exe calls
seem to be wrapped in double quotes, but this is described in the commit as a
fix for the calls not working. So, I don't really know what's going on, but this
fix works for me, for now:

    $ cd ~/.vim/bundle/vundle && git am ~/vimconfig/patches/0001-Work-around-BundleInstall-not-working.patch
