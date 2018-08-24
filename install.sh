#!/bin/sh
if [[ -x "$(command -v xcode-select)" ]]; then
    echo Install xcodeutils…
    read -p "Press any key to continue... " -n1 -s
    echo  '\n'
    xcode-select --install
fi
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
echo Install oh-my-zsh
read -p "Press any key to continue... " -n1 -s
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo '\n'
echo Install Vundle
read -p "Press any key to continue... " -n1 -s
if [ ! -d "$HOME/.vim" ]; then
    echo Creating $HOME/.vim
    mkdir $HOME/.vim
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

