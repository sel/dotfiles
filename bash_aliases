#!/bin/bash
# (shebang is unnecessary here: present only to enable syntax highlighting)

alias ll='ls -lAsh'
alias hf='history | grep -i $*'
alias grepc='grep --color=always'
alias tbfinfo="egrep --color=always '[\+<]' /var/log/tbfeed/tbfeed.log | tail"
