alias ffmpeg='avconv'
alias aptitude='apt-get'

function mmkv() {
	makemkvcon --minlength=${2:-3600} mkv disc:0 all ${1:-.};
}

function mkcd() { mkdir -p "$*"; cd "$*"; }

function ta() {
	if (`tmux list-sessions | wc -l` -ne 1); then
		echo "in -ne"
		tmux attach-session -t `tmux list-sessions | cut -d: -f1 | cut -d\  -f1`;
	else
		echo "not in -ne"
		tmux attach
	fi
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"

function get_status() {
    STATUS=""
    STATUS_COUNT=0

    branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
    if [ ! -z "$branch" ]
    then
        STATUS="$YELLOW$(echo -e "\xE2\x8E\x87") $branch "
        ((STATUS_COUNT+=3))
    fi

    stash=$(git stash list -n 100 2> /dev/null | wc -l | sed 's/^[ \t]*//')
    if [ $((stash)) -gt 0 ]
    then
        STATUS="$STATUS$BLUE[$(echo -e "\xE2\x98\xB0") $stash]"
        ((STATUS_COUNT+=1))
    fi

    job=$(jobs | wc -l | sed 's/^[ \t]*//')
    if [ $((job)) -gt 0 ]
    then
        STATUS="$STATUS$GREEN[$(echo -e "\xE2\x8C\xA7")$job]"
        ((STATUS_COUNT+=1))
    fi

    commits=$(git rev-list HEAD@{upstream}..HEAD 2> /dev/null | wc -l | sed 's/^[ \t]*//')
    if [ $((commits)) -gt 0 ]
    then
        STATUS="$STATUS$RED[$(echo -e "\xE2\x87\xA7")$commits]"
        ((STATUS_COUNT+=1))
    fi
}

function generate_prompt() {
    get_status
    if [ "$(tput cols)" -lt 100 ] 
    then
        ((STATUS_COUNT+=1))
    fi

    if [ "$STATUS_COUNT" -gt 3 ] 
    then
        PS1="\n\t $GREEN\u$NO_COLOUR \w\n$STATUS$NO_COLOUR\n\$ "
    elif [ ! -z "$STATUS" ]
    then
        PS1="\t $STATUS $GREEN\u$NO_COLOUR \w$NO_COLOUR\n\$ "
    else
        PS1="\t $GREEN\u$NO_COLOUR \w\n\$ "
    fi

}
# PS1="$GREEN\u$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$BLUE\$(git_stash_size)$NO_COLOUR$(job_queue_size)\n\$ "
# PROMPT_COMMAND=generate_prompt
