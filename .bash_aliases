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
