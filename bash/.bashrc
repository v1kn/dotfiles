
#       PREAMBLE [-
#       ========

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# VIM
export EDITOR='vim'
export VISUAL='vim'

# replace Caps with Ctrl
setxkbmap -option ctrl:nocaps

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
#-]

#       CUSTOM BASH PROMPT [-
#       ==================
# inspired by: https://github.com/maciakl/.dotfiles/blob/master/.bashrc

#       ANSI COLOR CODES [-
#       ----------------
#0 Black
#1 Red
#2 Green
#3 Yellow/Brown
#4 Blue
#5 Pink
#6 Cyan
#7 White/Gray
#
#3_  sets grim    foreground color
#9_  sets intense foreground color
#4_  sets grim    background color
#10_ sets intense background color
#
#0 reset all colors
#1 bold
#3 italics
#4 underline
#5 blink
#7 inverse

Color_Off="\[\033[0m\]"
Red="\[\033[0;31m\]"
Green="\[\033[0;32m\]"
Yellow="\[\033[0;33m\]"
Blue="\[\033[0;34m\]"
Purple="\[\033[0;35m\]"
Cyan="\[\033[0;36m\]"
White="\[\033[0;37m\]"
BRed="\[\033[1;31m\]"
BPurple="\[\033[1;35m\]"

#-]

eval "`dircolors -b`"
#PROMPT_DIRTRIM=3

function __prompt_command()
{
    # starter
    PS1=""

    # SSH, client IP
    if [ -n "$SSH_CLIENT" ]
    then
        PS1+="\[$Yellow\]("${$SSH_CLIENT%% *}")\[$Color_Off\]"
    fi

    # basic info: bash + path
    #PS1+="["$Green"bash$Color_Off]:"
    PS1+="[$BPurple\w$Color_Off]"

    # check if inside git repo
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]
    then
        # parse the porcelain output of git status
        if [[ "$git_status" =~ nothing\ to\ commit ]]
        then
            local Color_On=$Green
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]
        then
            local Color_On=$Purple
        elif [[ "$git_status" =~ Changes\ not\ staged\ for\ commit ]]
        then
            local Color_On=$BRed
        elif [[ "$git_status" =~ Changes\ to\ be\ committed ]]
        then
            local Color_On=$Yellow
        else
            local Color_On=$BRed
        fi

        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]
        then
            branch=${BASH_REMATCH[1]}
        else
            # Detached HEAD. (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null || echo HEAD`)"
        fi

        # add the result to prompt
        PS1+=""$White"git\[$Color_On\][$branch]\[$Color_Off\]"
    fi

    # finisher
    PS1+="\n["$Green"bash$Color_Off]"
    PS1+=" \$ "
}
PROMPT_COMMAND=__prompt_command

#PS1=""
#PS1+="["$Green"bash$Color_Off]:"
#PS1+="[$BPurple\w$Color_Off]>"
#PS1+="\$ "

#PS1='[bash]:[\w]>\$ '
#PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\$ '
#-]

#       GENERAL MODS [-
#       ============

# prevent file overwrite with > redirection ( use >| to force)
set -o noclobber

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case off"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous off"

# Entering a directory name as a bare word will change into that directory
shopt -s autocd

# Automatically correct off-by-one typing mistakes when changing directories
shopt -s cdspell

# Correct off-by-one typing mistakes when tab-completing directories
shopt -s dirspell

# Enable fancy globbing functions
shopt -s extglob

# update window size after every command
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Don't try to complete on empty lines
shopt -s no_empty_cmd_completion

# Globs won't consider case
shopt -s nocaseglob

# Globs will consider hidden files, too
shopt -s dotglob

# combine multiline commands in history
shopt -s cmdhist

# append to the history file, don't overwrite it
shopt -s histappend

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth:erasedups

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=500000
HISTFILESIZE=100000

# dont record some commands
export HISTIGNORE="ls:ll:history:cd"

#-]

#       ALIASES [-
#       =======

# ubuntu package management
alias rdeps='apt-cache rdepends'
alias deps='apt-cache depends'
alias ins='sudo apt-get install'
alias rmv='sudo apt-get --purge remove'
alias armv='sudo apt-get --purge autoremove'
alias ser='apt-cache search'
alias show='aptitude show'
alias upd='sudo apt-get update && sudo apt-get dist-upgrade'

# trash
alias trl='trash-list'
alias tre='trash-empty'
alias trrm='trash-rm $1'
alias trrs='restore-trash'
alias trp='trash-put'

# colors
alias ls='ls --color=auto -h --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='colordiff'

# vim
alias vir='vim $HOME/.vimrc'
alias vib='vim $HOME/.bashrc'
alias vilog='view -M "+call Tailf()" $1'
alias vfs='sudo vim /etc/fstab'

alias ll='ls -alFp'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias bc='bc -l'
alias mkdir='mkdir -pv'
alias h='history'
alias ,='ls -CFsph'
alias h='df -h'
alias d='du -sh .'
alias D='du -s * | sort -n'
alias dic='sdcv --color'
alias p8='ping 8.8.8.8'
alias spd='speedtest-cli'
alias tmux='TERM=xterm-256color /usr/bin/tmux'
alias stw='stow  -t /home/vlkn/ -vv'
alias ranger='TERM=xterm-256color ranger'
alias rr='TERM=xterm-256color ranger'
alias vd='/usr/bin/vd'
alias todaydate='date +%Y%m%d'
alias emacs='echo "lol, nice try"; sleep .5; vim'
alias cm='cmatrix -C yellow -u 9'
alias mpvnov='mpv --no-video'
alias dot='cd $HOME/git-repos/dotfiles'
alias cal='cal -3':

# complex
alias pipes='$HOME/.filez/scripts-ref/pipsies.sh -p 2 -f 40 -R -r 5000'
alias pipesx='$HOME/.filez/scripts-ref/pipesx.sh -n 2 -t 0 -t 1 -R -r 5000'
alias flacsplit='shnsplit -f *.cue -t "%n-%t" -o flac *.flac'
alias pkeys='xmodmap -e "keycode 101 = ISO_Level3_Shift"'
alias caps='setxkbmap -option ctrl:nocaps'
alias t2pdf='pandoc -V fontsize=12pt --latex-engine=xelatex -V mainfont="TakaoMincho" -f markdown_github'
alias getpage='wget -cNkKE -np -P $HOME/Documents/webpages/'
#alias synapse='Exec=GTK_IM_MODULE='' synapse'
alias lsblk='lsblk -o NAME,SIZE,FSTYPE,TYPE,LABEL,MOUNTPOINT,UUID'
#-]

#       FUNCTIONS [-
#       =========

#       Audio [-
#       -----

# check if flacs in subdirectories have album art embedded
checkpicflac() {
    find . -depth -type f -name "*.flac" |
    while read -r track
    do
        pic=$(metaflac --list --block-type=PICTURE "$track")
        [[ -z "$pic" ]] && echo ""$track" has no picture"
    done
}

# add a YEAR tag to flacs in all subdirectories
addyearflac() {
    find . -depth -type f -name "*.flac" |
    while read -r track
    do
        year=$(metaflac --show-tag=DATE "$track" | cut -d= -f 2)
        metaflac --set-tag="YEAR=$year" "$track"
    done
}

# check whether flacs in subdirectores have a YEAR tag
checkyearflac() {
    find . -depth -type f -name "*.flac" |
    while read -r track
    do
        year=$(metaflac --show-tag=YEAR "$track")
        [[ -z "$year" ]] && echo ""$track" has no YEAR tag"
    done
}

# playing current dir files with mpv playlist
PlayCurrentDir() {
    mpv --no-video --playlist <(find "$PWD" -type f -follow | sort)
}
alias pcd='PlayCurrentDir'

#find . -type f -print0 | sort -zn | xargs -0 -I{} -n1 -P `nproc` sox "{}" -n spectrogram -o "{}.png"

# multi-folder spectrograms
spectro_flac_mass() {
    find . -depth -type f -name "*.flac" | sort |
    while read -r file
    do
        sox "$file" -n spectrogram -o "$file".png
    done
}
# as above but more powerful; parallel processes and proper output
spectro_flac_mass2() {
    find . -depth -type f -name "*.flac" -print0 | sort -zn | xargs -0 -I{} -n1 -P$(($(nproc) / 2)) sh -c 'sox "{}" -n spectrogram -o "{}.png"; echo processed "{}"'
}
spectro_wav_mass() {
    find . -depth -type f -name "*.wav" | sort |
    while read -r file
    do
        sox "$file" -n spectrogram -o "$file".png
    done
}
spectro_mp3_mass() {
    find . -depth -type f -name "*.wav" | sort |
    while read -r file
    do
        sox "$file" -n spectrogram -o "$file".png
    done
}
# single folder spectrograms
spectro_flac() {
    for i in *.flac
    do
        sox "$i" -n spectrogram -o "$i".png
    done
}
spectro_wav() {
    for i in *.wav
    do
        sox "$i" -n spectrogram -o "$i".png
    done
}
spectro_mp3() {
    for i in *.mp3
    do
        sox "$1" -n spectrogram -o "$i".png
    done
}
alias spcfm='spectro_flac_mass'
alias spcfm2='spectro_flac_mass2'
alias spcwm='spectro_wav_mass'
alias spcmm='spectro_mp3_mass'
alias spcf='spectro_flac'
alias spcw='spectro_wav'
alias spcm='spectro_mp3'
# play only audio from videos on the internet
vid_sound() {
    livestreamer --player-continuous-http --player-passthrough hls --hls-segment-threads 3 --player "mpv --no-video --cache 10240" $1
}
alias snd=vid_sound
#-]

#       Video [-
#       -----

# using livestreamer and mpv to play videos off of internet
tvb() {
    livestreamer --player-continuous-http --player-passthrough hls --hls-segment-threads 3 --player "mpv --cache 10240" $1 best
}
tvm() {
    livestreamer --player-continuous-http --player-passthrough hls --hls-segment-threads 3 --player "mpv --cache 10240" $1 medium
}
twitchb() {
    livestreamer --retry-open 8000 --retry-streams 10 --player-continuous-http --player-passthrough hls --hls-segment-threads 3 --player "mpv --cache 10240" https://twitch.tv/$1 best
}
twitchm() {
    livestreamer --retry-open 8000 --retry-streams 10 --player-continuous-http --player-passthrough hls --hls-segment-threads 3 --player "mpv --cache 10240" https://twitch.tv/$1 medium
}
twitch_aris_medium() {
    livestreamer --retry-open 8000 --retry-streams 10 --player-continuous-http --player-passthrough hls --hls-segment-threads 3 --player "mpv --cache 10240" https://twitch.tv/avoidingthepuddle medium
}
alias arism=twitch_aris_medium
twitch_aris_best() {
    livestreamer --retry-open 8000 --retry-streams 10 --player-continuous-http --player-passthrough hls --hls-segment-threads 3 --player "mpv --cache 10240" https://twitch.tv/avoidingthepuddle best
}
alias arisb=twitch_aris_best
#-]

#       Japanese [-
#       --------

# list on'yomi of a kanji, using kanjidic
dicon() {
    perl -CSAD -e '$r=join q(|),grep /\p{cjk}/,split//,qq(@ARGV)||qx(xclip -o);$r||die qq(nothing given\n);open$f,q(<),qq($ENV{HOME}/.filez/dic/kanjidicx.utf8);while(<$f>){if(/^($r)/){$k=$1;($o)=/\s(\p{kana}+(\s\p{kana}+)*)\s/;print qq($k: $o\n)}}' "$@"
}
#-]

#       Package management [-
#       ------------------

# removing build dependencies installed with apt-get build-dep
deprem() {
    sudo aptitude markauto $(apt-cache showsrc $1 | grep Build-Depends |
    perl -p -e 's/(?:[\[(].+?[\])]|Build-Depends:|,|\|)//g')
}

# showing installed headers and kernels
# to uninstall these headers, pipe it through to "| xargs dpkg -r"
showheader() {
    dpkg-query -l linux-header* | grep 'ii ' |
    while read k
    do
        v=$(echo "$k" | cut -d- -f4 | cut -d' ' -f1)
        [ ! -z "$v" ] && [ "$v" -le $(uname -r | cut -d- -f 2) ] && echo $k | cut -d' ' -f2
    done
}
showkernel() {
    dpkg-query -l linux-image* | grep 'ii ' | fgrep '4.2' | awk '{print $2}'
}

# list all PPAs installed
listppa() {
    grep -RoPish '(?<=ppa.launchpad.net/)[^/]+/[^/ ]+' /etc/apt |
    sort -u
}

# check if PPAs are compatible with this ubuntu version
checkppa() {
    dist=$(lsb_release -sc)
    ppas=$(grep -RoPish '(?<=ppa.launchpad.net/)[^/]+/[^/ ]+' /etc/apt | sort -u)
    #ppas=$(cat /pathto/ppafile)
    while read -r ppa; do
        url="http://ppa.launchpad.net/$ppa/ubuntu/dists/$dist/"
        if [[ $(wget -O /dev/null "$url" 2>&1|grep "200 OK"|wc -l) == "0" ]]
        then
            echo "$ppa does not have a $dist version"
        fi
    done <<< "$ppas"
}
#-]

#       git stuff [-
#       ---------

# .gitignore file generation
gi() {
    curl -L -s https://www.gitignore.io/api/"$@" ;
}

# create git repo folder with basic files inside
mkrep() {
    mkdir -p $HOME/git-repos/"$@"
    cd $HOME/git-repos/"$1"
    touch README.md
    cp $HOME/git-repos/dotfiles/LICENSE.md .
    gi linux,vim > .gitignore
}
#-]

#       Filesystem [-
#       ----------

# create directory and cd into it
mkd() {
    mkdir -p "$@" && cd "$@"
}

# count lines in files, omitting newlines and/or comments
CountLines_NoNewline() {
    grep -cve '^\s*$' $1
}
CountLines_NoNewline_NoHashComment() {
    sed '/^\s*#/d;/^\s*$/d' $1 | wc -l
}
alias clin='CountLines_NoNewline'
alias clinc='CountLines_NoNewline_NoHashComment'
#-]

#       Web APIs [-
#       --------

# getting geolocation info from google maps api
geoloc() {
    wget -O- -q https://maps.googleapis.com/maps/api/geocode/json?address=$1
}

# get weather on the commandline
wttr() {
    curl -k "https://wttr.in/$1"
}
#-]
