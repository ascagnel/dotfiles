if [[ -x "$(command -v fortune)" ]]; then
    echo ""
    fortune
fi
if [[ -x "$(command -v tmux)" ]]; then
    echo ""
    tmux list-sessions
fi
echo ""
