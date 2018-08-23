# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx sublime yarn colored-man-pages vi-mode node-modules-path)

# User configuration
DEFAULT_USER=`whoami`

export PATH=bin:/opt/boxen/rbenv/shims:/opt/boxen/rbenv/bin:/opt/boxen/ruby-build/bin:/opt/boxen/homebrew/bin:/opt/boxen/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X12/bin:/opt/boxen/bin:${HOME}/.bin
export PATH=/opt/boxen/homebrew/Cellar/yarn/1.7.0/bin:/opt/boxen/homebrew/opt/node@8/bin:$PATH:
export PATH=$PATH:$(yarn global bin)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim -u ~/.nvimrc'
# else
#   export EDITOR='mvim -v'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export XDG_CONFIG_HOME="$HOME/Library/Preferences"
export XDG_DATA_HOME="$HOME/Library"
export XDG_CACHE_HOME="$HOME/Library/Caches"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias nvim="nvim -u ~/.nvimrc"
alias vim="nvim -u ~/.nvimrc"
alias gi="git st"
alias ll="ls -al"
if hash trash 2>/dev/null; then
    alias rm="trash"
fi

if hash rg 2>/dev/null; then
    alias grep="rg"
fi

#function powerline_precmd() {
#    PS1="$(~/powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
#}

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

#function install_powerline_precmd() {
#  for s in "${precmd_functions[@]}"; do
#    if [ "$s" = "powerline_precmd" ]; then
#      return
#    fi
#  done
#  precmd_functions+=(powerline_precmd)
#}

#if [ "$TERM" != "linux" ]; then
#  install_powerline_precmd
#fi

[ -f .zshrc_local ] && source .zshrc_local

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /Users/andrew.scagnelli/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh ]] && . /Users/andrew.scagnelli/.config/yarn/global/node_modules/tabtab/.completions/yarn.zsh

#
export DEFAULT_USER=`id -un`
export HOSTNAME=`hostname -s`

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
      prompt_segment black default "%(!.%{%F{yellow}%}.)$USER@$HOSTNAME"
  fi
}
