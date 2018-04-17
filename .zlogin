if [[ -x "$(command -v fortune)" ]]; then
    fortune
    echo ""
fi
if [[ -x "$(command -v tmux)" ]]; then
    tmux list-sessions
    echo ""
fi
