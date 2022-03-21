# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jreese"

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
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/dotfiles/zsh_custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode)

# User configuration
export PATH=$PATH:bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X12/bin:/opt/boxen/bin:${HOME}/.bin:./node_modules/.bin

[ -f "${HOME}/.zshrc_local" ] && source "${HOME}/.zshrc_local"

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export FZF_TMUX_OPTS='-p 80%'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi="nvim"
alias ta="tmux a -t "
alias jsonpp="json_pp -json_opt pretty,utf8"
#alias tc="tmux new-session -t"
#alias edit="open -a TextEdit"

if hash trash 2>/dev/null; then
    alias rm="trash"
fi

if hash rg 2>/dev/null; then
    alias grep="rg"
fi

if hash yt-dlp 2>/dev/null; then
    alias youtube-dl="yt-dlp"
fi

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

export DEFAULT_USER="$(whoami)"
export HOSTNAME=`hostname -s`

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
      prompt_segment black default "%(!.%{%F{yellow}%}.)$USER@$HOSTNAME"
  fi
}

# fshow - git commit browser (enter for show, ctrl-d for diff, ` toggles sort)
fshow() {
  local out shas sha q k
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      fzf-tmux -p --ansi --multi --no-sort --reverse --query="$q" \
          --print-query --expect=ctrl-d --toggle-sort=\`); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    [ -z "$shas" ] && continue
    if [ "$k" = ctrl-d ]; then
      git diff --color=always $shas | less -R
    else
      for sha in $shas; do
        git show --color=always $sha | less -R
      done
    fi
  done
}

fd() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf-tmux -m -p 80% --ansi --preview $preview
}

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-tmux -p 80% -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

if [ "(uname -s)" = "Darwin" ]; then
  sudo() {
    unset -f sudo
    if [[ "$(uname)" == 'Darwin' ]] && ! grep 'pam_tid.so' /etc/pam.d/sudo --quiet; then
      sudo sed -i -e '1s;^;auth       sufficient     pam_tid.so\n;' /etc/pam.d/sudo
    fi
    if [[ "$(uname)" == 'Darwin' ]] && ! grep 'pam_watchid.so' /etc/pam.d/sudo --quiet; then
      sudo sed -i -e '1s;^;auth       sufficient     pam_watchid.so "reason=execute a command as root"\n;' /etc/pam.d/sudo
    fi
    sudo "$@"
  }
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
