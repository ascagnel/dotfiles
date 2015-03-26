alias rt='rtorrent'
alias ffmpeg='avconv'
alias aptitude='apt-get'
function mmkv() {
	makemkvcon --minlength=${2:-3600} mkv disc:0 all ${1:-.};
}
function mkcd() { mkdir -p "$*"; cd "$*"; }
