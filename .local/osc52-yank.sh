#!/bin/sh

printf "\033]52;c;%s\007" "$(base64 | tr -d '\n')" > "$(tmux display-message -p '#{pane_tty}')"
