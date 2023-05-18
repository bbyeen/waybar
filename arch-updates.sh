#!/bin/bash

function CheckUpdates() {
updates="$(checkupdates;yay -Qum)"
arch="$(checkupdates | wc -l)"
aur="$(yay -Qum | wc -l)"
number=$((arch+aur))

if [ "$number" -gt 0 ]; then
    text="$number"
else
    text=""
fi

echo "$text"
}

function RefreshUpdates() {
  value="$(CheckUpdates)"
  eww update arch-updates="$value"
}

function Update() {
	alacritty 'yay'
	RefreshUpdates
}

case "$1" in
        Refresh)
            RefreshUpdates
	    exit 0
            ;;
	Update)
            Update
	    exit 0
	    ;;
        *)
            CheckUpdates
            exit 0 
esac
