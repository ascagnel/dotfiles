#!/bin/sh
if [[ -x "$(command -v xcode-select)" ]]; then
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
echo '\n'
if [[ "$OSTYPE" =~ ^darwin ]]; then
    if [[ ! -x "$(command -v brew)" ]]; then
        echo Install Homebrew, and homebrew bundle…
        read -p "Press any key to continue... " -n1 -s
        echo  '\n'
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew tap Homebrew/bundle
        echo  '\n'
        echo Install bundled software
        read -p "Press any key to continue... " -n1 -s
        brew bundle
        echo  '\n'
    else
        echo "Not installing Homebrew"
        echo  '\n'
    fi
fi
if [[ -z "$XDG_CONFIG_HOME" ]]; then
    echo "\$XDG_CONFIG_HOME is not set; setting to \$HOME/Library/Preferences"
    read -p "Press any key to continue... " -n1 -s
    if [[ "$OSTYPE" =~ ^darwin ]]; then
        export XDG_CONFIG_HOME=$HOME/Library/Preferences
    else
        export XDG_CONFIG_HOME=$HOME/.config
    fi
else
    echo "XDG_CONFIG_HOME already set; not resetting"
fi
echo  '\n'
if [ ! -d "$HOME/.vim" ]; then
    echo Creating $HOME/.vim
    mkdir $HOME/.vim
    mkdir $HOME/.vim/plugged
    mkdir $HOME/.vim/autoload
    mkdir $HOME/.vim/files
    mkdir $HOME/.vim/files/backupdir
    mkdir $HOME/.vim/files/swapdir
    mkdir $HOME/.vim/files/undodir
fi

if [ ! -f "$HOME/.nvimrc" ]; then
    ln -s $PWD/.nvimrc $HOME/.vimrc
    echo "linked .vimrc"
else
    echo "Not linking .vimrc"
fi

if [ ! -f "$HOME/.nvimrc" ]; then
    ln -s $PWD/.nvimrc $HOME/.nvimrc
else
    echo "Not linking .nvimrc"
fi

if [ ! -f "$HOME/.zshrc" ]; then
    ln -s $PWD/.zshrc $HOME/.zshrc
    echo "linked .zshrc"
else
    echo "Not linking .zshrc"
fi

if [ ! -f "$HOME/.zlogin" ]; then
    ln -s $PWD/.zlogin $HOME/.zlogin
    echo "linked .zlogin"
else
    echo "Not linking .zlogin"
fi

if [ ! -f "$HOME/.tmux.conf" ]; then
    ln -s $PWD/.tmux.conf $HOME/.tmux.conf
    echo "linked tmux config"
else
    echo "Not linking tmux config"
fi

if [ ! -f "$HOME/.gitconfig" ]; then
    ln -s $PWD/.gitconfig $HOME/.gitconfig
    echo "linked git config"
else
    echo "Not linking git config"
fi

if [ ! -f "$HOME/.gitignore_global" ]; then
    ln -s $PWD/.gitignore_global $HOME/.gitignore_global
    echo "Linked gitignore"
else
    echo "Not linking gitignore"
fi

if [ ! -d "$XDG_CONFIG_HOME/nvim" ]; then
    echo Creating $XDG_CONFIG_HOME/nvim
    mkdir $XDG_CONFIG_HOME/nvim
    ln $PWD/.nvimrc $XDG_CONFIG_HOME/nvim/init.vim
    echo "Linked .nvimrc to XDG_CONFIG_HOME"
else 
    echo "Not linking .nvimrc to XDG_CONFIG_HOME"
fi
