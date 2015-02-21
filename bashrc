#!/bin/bash
# (shebang is unnecessary here: present only to enable syntax highlighting)

# set default text editor to be vim
#export EDITOR='vim'
#alias nano='vim'

# Make less support ANSI colour codes (-R) and
# disable paging for single screenfulls (-FX)
export LESS='-RFX'

# Don't leave man pages on the screen
export MANPAGER='less -+F -+X'

# Support for syntax highlighting in less (via .lessfilter/pygments)
if which pygmentize > /dev/null; then export LESSOPEN='|~/.lessfilter %s'; fi

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# set locale for python
export LANG="en_GB.UTF-8"
export LC_COLLATE="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LC_MESSAGES="en_GB.UTF-8"
export LC_MONETARY="en_GB.UTF-8"
export LC_NUMERIC="en_GB.UTF-8"
export LC_TIME="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# install aliases
[[ -s ~/.bash_aliases ]] && source ~/.bash_aliases

# install custom bash prompt if exists
[[ -s ~/.bash_prompt ]] && source ~/.bash_prompt

# rbenv config
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

# android path extensions
export ANDROID_HOME=/Users/sel/Development/adt-bundle-mac-x86_64-20131030/sdk
if [ -d $ANDROID_HOME ]; then
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$ANDROID_HOME/platform-tools
    export PATH=$PATH:$ANDROID_HOME/build-tools/android-4.4
fi

# android ndk
export NDKROOT=/Users/sel/Development/android-ndk-r9d/

# go development
export GOPATH=$HOME/Development/go

# use a pip download cache
export PIP_DOWNLOAD_CACHE=~/.pipcache

# (homebrew): move /usr/local/bin and /usr/local/sbin to the start of PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# (jenv): Java environment switcher a la rbenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# remove duplicates from PATH
set -f         # Turn off globbing, to allow unprotected variable substitutions
IFS=:
old_PATH=$PATH:; PATH=
while [ -n "$old_PATH" ]; do
  x=${old_PATH%%:*}       # the first remaining entry
  case $PATH: in
    *:${x}:*) :;;         # already there
    *) PATH=$PATH:$x;;    # not there yet
  esac
  old_PATH=${old_PATH#*:}
done
PATH=${PATH#:}
set +f; unset IFS old_PATH x

# Display welcome message
[[ -s ~/.welcome ]] && ~/.welcome
