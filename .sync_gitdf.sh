#!/usr/bin/env bash

alias gitdf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

gitdfstatus="$(gitdf status --porcelain | wc -l)"

if [ "$gitdfstatus" -ne 0 ]
then

    gitdf add --update
    gitdf commit -m "Last sync: $(date +"%Y-%m-%d %H:%M:%S")"
    gitdf pull --rebase
    sleep 5
    gitdf push

fi