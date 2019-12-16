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
fi
ln -s $HOME/dotfiles/.nvimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.nvimrc $HOME/.nvimrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.zlogin $HOME/.zlogin
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
