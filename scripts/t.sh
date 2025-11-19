#!/usr/bin/env bash
set -euo pipefail

# Directories to search
roots=( "$HOME/Code" "$HOME/Developer" "$HOME/Developer/private" )

# If a path argument is given, use it; otherwise, pick one via fzf
if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected="$(
    fd -a -t d -d 1 . "${roots[@]}" 2>/dev/null \
    | sort -u \
    | fzf --select-1 --exit-0
  )"
fi

# Exit if nothing selected
[[ -z "${selected:-}" ]] && exit 0

# Generate a tmux-safe session name from the leaf directory
session="$(basename -- "$selected" | tr -c '[:alnum:]_-' '_')"

# Switch to existing session, or create/attach if missing
tmux switch-client -t "=${session}" 2>/dev/null || tmux new-session -As "$session" -c "$selected"
