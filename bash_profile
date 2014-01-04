#!/bin/bash
# (shebang is unnecessary here: present only to enable syntax highlighting)

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export HISTCONTROL=erasedups

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31'

[[ -s ~/.bashrc ]] && source ~/.bashrc
