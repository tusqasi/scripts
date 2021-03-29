#! /usr/bin/env bash

function tmux_sessions()
{
    tmux list-session -F '#S'
}

TMUX_SESSION=$( (tmux_sessions; echo "New") | rofi -dmenu -p "Select existing tmux session")

if [[ x"New" = x"${TMUX_SESSION}" ]]; then
    NAME=$(rofi -dmenu -p "Name for new session")
    alacritty -e tmux new-session -t "${NAME}" &
elif [[ -z "${TMUX_SESSION}" ]]; then
    echo "Cancel"
else
    alacritty -e tmux attach -t "${TMUX_SESSION}" &
fi
