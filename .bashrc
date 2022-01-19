#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias config='/usr/bin/git --git-dir=/home/synchronous/.cfg/ --work-tree=/home/synchronous'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
