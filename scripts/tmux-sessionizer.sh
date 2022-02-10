#!/usr/bin/env bash

 if [[ $# -eq 1 ]]; then
    selected=$1
 else
  selected=$(find ~/my ~/work ~/ ~/personal ~/shit -mindepth 1 -maxdepth 1 -type d | fzf)
 fi

 if [[ -z $selected ]]; then
    exit 0
 fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

 if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
   echo "IM RUNNIG"
   tmux new-session -s $selected_name -c $selected -n MAIN
   exit 0
fi

if ! tmux has-session -t "=$selected_name" 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected -n MAIN
fi


if [ ! $TMUX ] ; then
 tmux a -t $selected_name
else
 tmux switch-client -t $selected_name
fi
