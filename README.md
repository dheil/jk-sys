jk-sys
======

My system configuration and dotfiles for zsh, vim, screen and so on, use it localy in home dir or global in /etc


## How to install

### Variant A - global

Install global into `/opt/jk-sys` and `/etc`:

    git clone --recursive https://github.com/jkuetemeier/jk-sys.git /opt/jk-sys
    /opt/jk-sys/install.sh -g

### Variant B - local

Install local into your $HOME directory:

    cd # switch to home
    git clone --recursive https://github.com/jkuetemeier/jk-sys.git ~/.jk-sys
    ~/.jk-sys/install.sh

