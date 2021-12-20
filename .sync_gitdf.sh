#!/usr/bin/env bash

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

gitdfstatus="$(gitdf status --porcelain | wc -l)"

if [ "$gitdfstatus" -ne 0 ]
then

    gitdf add --update
    gitdf commit -m "Last sync: $(date +"%Y-%m-%d %H:%M:%S")"
    gitdf pull --rebase
    gitdf push

fi