#!/bin/sh
if [ -x "$(command -v xcode-select)" ]; then
    echo Install xcodeutils…
    read -p "Press any key to continue... " -n1 -s
    echo  '\n'
    xcode-select --install
fi
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo Install oh-my-zsh
    read -p "Press any key to continue... " -n1 -s
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "$HOME/.oh-my-zsh already exists, not installing oh-my-zsh"
fi
if [ "(uname -s)" = "Darwin" ]; then
    if [ ! -x "$(command -v brew)" ]; then
        echo Install Homebrew, and homebrew bundle…
        read -p "Press any key to continue... " -n1 -s
        echo  '\n'
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew tap Homebrew/bundle
        echo Install bundled software
        read -p "Press any key to continue... " -n1 -s
        brew bundle
    else
        echo "Not installing Homebrew"
    fi
    else
        echo "Not installing Homebrew"
fi

if [ -z "$XDG_CONFIG_HOME" ]; then
    if [ "$OSTYPE" =~ ^darwin ]; then
        echo "\$XDG_CONFIG_HOME is not set; setting to \$HOME/Library/Preferences"
        read -p "Press any key to continue... " -n1 -s
        export XDG_CONFIG_HOME=$HOME/Library/Preferences
    else
        echo "\$XDG_CONFIG_HOME is not set; setting to \$HOME/.config"
        read -p "Press any key to continue... " -n1 -s
        export XDG_CONFIG_HOME=$HOME/.config
    fi
else
    echo "XDG_CONFIG_HOME already set to $XDG_CONFIG_HOME; not resetting"
fi

if [ -f "$HOME/.oh-my-zsh/themes/gnzh-custom.zsh-theme" ]; then
    rm $HOME/.oh-my-zsh/themes/gnzh-custom.zsh-theme
fi
ln $PWD/gnzh-custom.zsh-theme $HOME/.oh-my-zsh/themes/gnzh-custom.zsh-theme

if [ ! -f "$HOME/.zshrc" ]; then
    ln -s $PWD/zshrc $HOME/.zshrc
    echo "Linked .zshrc"
else
    echo "Not linking .zshrc"
fi

if [ ! -f "$HOME/.zlogin" ]; then
    ln -s $PWD/zlogin $HOME/.zlogin
    echo "Linked .zlogin"
else
    echo "Not linking .zlogin"
fi

if [ ! -f "$HOME/.zlogout" ]; then
    ln -s $PWD/zlogout $HOME/.zlogout
    echo "Linked zlogout file"
else
    echo "Not linking zlogout"
fi

if [ ! -f "$HOME/.screenrc" ]; then
    ln -s $PWD/screenrc $HOME/.screenrc
    echo "Linked screenrc file"
else
    echo "Not linking screenrc"
fi

if [ ! -f "$HOME/.tmux.conf" ]; then
    ln -s $PWD/tmux.conf $HOME/.tmux.conf
    echo "Linked tmux config"
else
    echo "Not linking tmux config"
fi

if [ ! -f "$HOME/.gitconfig" ]; then
    ln -s $PWD/gitconfig $HOME/.gitconfig
    echo "Linked git config"
else
    echo "Not linking git config"
fi

if [ ! -f "$HOME/.gitignore_global" ]; then
    ln -s $PWD/gitignore_global $HOME/.gitignore_global
    echo "Linked gitignore"
else
    echo "Not linking gitignore"
fi

if [ ! -d "$XDG_CONFIG_HOME/nvim" ]; then
    ln -s $PWD/nvim $XDG_CONFIG_HOME
    echo "Linked nvim to $XDG_CONFIG_HOME/nvim"
else 
    echo "Not linking nvim to $XDG_CONFIG_HOME/nvim"
fi

echo "Setup complete, please start a new shell"
