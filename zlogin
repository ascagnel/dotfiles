echo ""

if [[ -x "$(command -v tmux)" ]]; then
    echo "Active tmux sessions:"
    tmux list-sessions | sed 's/:.*//'
    echo ""
fi

if [[ -f "$HOME/.zlogin_local" ]]; then
    sh "$HOME/.zlogin_local"
fi
