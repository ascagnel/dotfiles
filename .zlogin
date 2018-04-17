if [[ -n `command -v fortune` ]]; then
    echo ""
    fortune
fi
if [[ -n `command -v tmux` ]]; then
    echo ""
    tmux list-sessions
fi
echo ""
