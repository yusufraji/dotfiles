#!/usr/bin/env bash

gitdfstatus="$(gitdf status --porcelain | wc -l)"

if [ "$gitdfstatus" -ne 0 ]
then

    gitdf add --all
    gitdf commit -m "Last sync: $(date +"%Y-%m-%d %H:%M:%S")"
    gitdf pull --rebase
    gitdf push

fi