if [[ -x "$(command -v fortune)" ]]; then
    fortune
    echo ""
fi

if [[ -x "$(command -v tmux)" ]]; then
    tmux list-sessions | sed 's/:.*//'
    echo ""
fi

if [[ -f "$HOME/.zlogin_local" ]]; then
    sh "$HOME/.zlogin_local"
fi
