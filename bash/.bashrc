
#   PREAMBLE [-
#   ========

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# export variables
export EDITOR='vim'
export VISUAL='vim'
export GEM_PATH=$HOME/.local/gem
export CARGO_HOME=$HOME/.local/cargo

# path
if [[ -z $TMUX ]]; then
    PATH="$PATH:$HOME/.local/bin"
fi

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
# -]

#   PROMPT [-
#   ======

Color_Off="\033[0m"
Red="\033[0;31m"
Green="\033[0;32m"
Yellow="\033[0;33m"
Blue="\033[0;34m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
White="\033[0;37m"
BRed="\033[1;31m"
BPurple="\033[1;35m"

git_color()
{
  local git_status="$(git status 2> /dev/null)"

  #if [[ ! $git_status =~ "working directory clean" ]]; then
  if [[ $git_status =~ "Changes not staged for commit" ]]; then
    echo -e $Red
  elif [[ $git_status =~ "Changes to be committed" ]]; then
    echo -e $Yellow
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $Green
  elif [[ $git_status =~ "nothing added to commit but untracked files present" ]]; then
    echo -e $Purple
  else
    echo -e $Red
  fi
}

git_branch()
{
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "[$branch]"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

PS1=""
if [ -n "$SSH_CLIENT" ]; then
    PS1+="\[$Yellow\]("${SSH_CLIENT%% *}")\[$Color_Off\]"
fi
PS1+="\[$Yellow\][\u@\h]"
PS1+="\[$Cyan\] [\w]"            # basename of pwd
PS1+="\[\$(git_color)\]"        # colors git status
PS1+=" \$(git_branch)"           # prints current branch
PS1+="\n\[$Color_Off\]"
PS1+="\[$Cyan\] =>> \[$Color_Off\]"
export PS1

# legacy backup
# PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\$ '
# -]

#   GENERAL MODS [-
#   ============

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

# -]

#   ALIASES [-
#   =======

# package management
alias upda='sudo pacman -Syu'
alias updaa='sudo pacman -Syyu'
alias updo='sudo zypper up'
alias updu='sudo apt update && sudo apt full-upgrade'

alias insa='sudo pacman -S'
alias insaa='pacaur -ayu'
alias inso='sudo zypper in'
alias insu='sudo apt install'

alias sera='pacman -Ss'
alias seraa='pacaur -a'
alias sero='zypper se'
alias seru='apt search'

alias showa='pacman -Sii'
alias showu='aptitude show'

alias rmva='sudo pacman -Rns'
alias rmvaa='sudo pacman -Rns $(pacman -Qqdt)'
alias rmvo='sudo zypper rm'
alias rmvu='sudo apt-get --purge remove'
alias rmvuu='sudo apt-get --purge autoremove'

alias depsa='pactree'
alias rdepsa='pactree -r'
alias rdepsu='apt-cache rdepends'
alias depsu='apt-cache depends'

# trash
alias trl='trash-list'
alias tre='trash-empty'
alias trrm='trash-rm $1'
alias trrs='restore-trash'
alias trp='trash-put'

# colors
alias ls='ls --color=auto -h --group-directories-first -CF'
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
alias df='df -h -x tmpfs'
alias d='du -sh .'
alias D='du -s * | sort -n'
alias dic='sdcv --color'
alias p8='ping 8.8.8.8'
alias spd='speedtest-cli'
alias tmux='TERM=xterm-256color /usr/bin/tmux'
alias stw='stow  -t /home/vlkn/ -vv'
alias ranger='TERM=xterm-256color /usr/local/bin/ranger'
alias rr='TERM=xterm-256color /usr/local/bin/ranger'
alias todaydate='date +%Y%m%d'
alias emacs='echo "lol, nice try"; sleep .5; vim'
alias cm='cmatrix -C yellow -u 9'
alias mpvnov='mpv --no-video'
alias dot='cd $HOME/grepo/dotfiles'
alias dua='cd $HOME/grepo/DUApost'
alias bin='cd $HOME/grepo/bin'
alias cal='cal -3':
alias dfc='dfc -t -tmpfs'
alias netres='sudo systemctl restart NetworkManager'

#twitch
alias arism='twitchm avoidingthepuddle'
alias arisb='twitchb avoidingthepuddle'
alias hobm='twitchm the_happy_hob'
alias hobb='twitchb the_happy_hob'
alias distort2m='twitchm distortion2'
alias distort2b='twitchb distortion2'

# complex
alias pipes='$HOME/filez/linux/scripts-ref/pipsies.sh -p 2 -f 40 -R -r 5000'
alias pipesx='$HOME/filez/linux/scripts-ref/pipesx.sh -n 2 -t 0 -t 1 -R -r 5000'
alias flacsplit='shnsplit -f *.cue -t "%n-%t" -o flac *.flac'
alias pkeys='xmodmap -e "keycode 101 = ISO_Level3_Shift"'
alias lsblk='lsblk -o NAME,SIZE,FSTYPE,TYPE,LABEL,MOUNTPOINT,UUID'
alias subs='subdownloader -c -l en --rename-subs -V'
alias wfup='sudo nmcli c up id sadzo'
alias tvb='mpv --ytdl-format=22 $1'
alias tvm='mpv --ytdl-format=18 $1'
alias mpvtb='mpv --script-opts=osc-layout=topbar'
# -]

#   FUNCTIONS [-
#   =========

#   Audio [-
#   -----

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


# multi-folder spectrograms
spectro_flac() {
    find . -depth -type f -name "*.flac" -print0 | sort -zn |
    xargs -0 -I{} -n1 -P$(($(nproc) / 2)) sh -c 'sox "{}" -n spectrogram -o "{}.png"
    echo processed "{}"'
}
# as above but more powerful; arrays, parallel processes and proper output
spectro_mass() {
    ext=( -name \*.wav -o -name \*.flac -o -name \*.ape -o -name \*.m4a -o -name \*.mp3 -o -name \*.ogg )
    find . -depth -type f \( "${ext[@]}" \) -print0 | sort -zn |
    xargs -0 -I{} -n1 -P$(($(nproc) / 2)) sh -c 'sox "{}" -n spectrogram -o "{}.png"; echo processed "{}"'
}
alias spc='spectro_mass'
alias spcf='spectro_flac'

# -]

#   Video [-
#   -----

# using livestreamer and mpv to play videos off of internet
# deprecated. use mpv. leaving one function for historical purposes
#tvb() {
#    livestreamer --player-continuous-http --player-passthrough hls --hls-segment-threads 3 --player "mpv --cache 10240" $1 best
#}
twitchb() {
    livestreamer \
        --http-header Client-ID=jzkbprff40iqj646a697cyrvl0zt2m6 \
        --retry-open 8000 \
        --retry-streams 10 \
        --player-continuous-http \
        --player-passthrough hls \
        --hls-segment-threads 3 \
        --player "mpv" \
        https://twitch.tv/$1 best
}
twitchm() {
    livestreamer \
        --http-header Client-ID=jzkbprff40iqj646a697cyrvl0zt2m6 \
        --retry-open 8000 \
        --retry-streams 10 \
        --player-continuous-http \
        --player-passthrough hls \
        --hls-segment-threads 3 \
        --player "mpv" \
        https://twitch.tv/$1 medium
}

subs-mass() {
    ext=( -iname \*.mp4 -o -iname \*.avi -o -iname \*.mkv )
    find . -depth -type f \( "${ext[@]}" \) -print0 | sort -zn |
    xargs -0 -I{} -n1 -P$(($(nproc) / 2)) sh -c 'subdownloader -c -l en --rename-subs -V "{}"; echo processed "{}"'
}
# -]

#   Japanese [-
#   --------

# list on'yomi of a kanji, using kanjidic
dicon() {
    perl -CSAD -e '$r=join q(|),grep /\p{cjk}/,split//,qq(@ARGV)||qx(xclip -o);$r||die qq(nothing given\n);open$f,q(<),qq($ENV{HOME}/.filez/dic/kanjidicx.utf8);while(<$f>){if(/^($r)/){$k=$1;($o)=/\s(\p{kana}+(\s\p{kana}+)*)\s/;print qq($k: $o\n)}}' "$@"
}
# -]

#   Package management [-
#   ------------------

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
    dpkg-query -l linux-image* | grep 'ii ' | fgrep '4.4' | awk '{print $2}'
}

# list all PPAs installed
listppa() {
    grep -RoPish '(?<=ppa.launchpad.net/)[^/]+/[^/ ]+' /etc/apt |
    sort -u
}

# check if PPAs are compatible with this ubuntu version
checkppa() {
    dist=$1
    ppas=$(grep -RoPish '(?<=ppa.launchpad.net/)[^/]+/[^/ ]+' /etc/apt | sort -u)
    while read -r ppa; do
        url="http://ppa.launchpad.net/$ppa/ubuntu/dists/$dist/"
        if [[ $(wget -O /dev/null "$url" 2>&1|grep "200 OK"|wc -l) == "0" ]]
        then
            echo "$ppa does not have a $dist version"
        fi
    done <<< "$ppas"
}
# -]

#   git stuff [-
#   ---------

# .gitignore file generation
gi() {
    curl -L -s https://www.gitignore.io/api/"$@" ;
}

# create git repo folder with basic files inside
mkrep() {
    mkdir -p $HOME/grepo/"$@"
    cd $HOME/grepo/"$1"
    touch README.md
    cp $HOME/grepo/dotfiles/LICENSE.md .
    gi linux,vim > .gitignore
}
# git fetch for multiple repos
gfall() {
    ls | xargs -I{} -n1 -P$(nproc) git -C {} fetch
}
# git pull for multiple repos
gpall() {
    ls | xargs -i{} -n1 -P$(nproc) git -C {} pull
}
# -]

#   Filesystem [-
#   ----------

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
# -]

#   Web [-
#   ---

# getting geolocation info from google maps api
geoloc() {
    wget -O- -q https://maps.googleapis.com/maps/api/geocode/json?address=$1
}
# get weather on the commandline
wttr() {
    curl -k "https://wttr.in/$1"
}
# tny urls
tny() {
    echo $(wget -qO- http://tny.im/yourls-api.php?action=shorturl\&format=simple\&url=$1)
}
untny() {
    echo $(wget -qO- http://tny.im/yourls-api.php?action=expand\&format=simple\&shorturl=$1)
}

getpage() {
    local wget_options=(
        --continue                      # -c
        --timestamping                  # -N
        --convert-links                 # -k
        --backup-converted              # -K
        --adjust-extension              # -E
        --no-parent                     # -np
        -P $HOME/Documents/webpages/
    )
    wget "${wget_options[@]}" "$@"
}
# -]

#   Other [-
#   -----

# adding all virtual machines to virtualbox at once
vbox_add() {
find "/media/wde2/virt/vm/" -depth -type f -name "*.vbox" |
while read vm
do
    VBoxManage registervm "$vm"
done
}

top10() {
    history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10
}

vbox_snapvm() {
    VBoxManage list vms | cut -d\" -f2 |
    while read vm
    do
        VBoxManage snapshot "$vm" delete 0
        VBoxManage snapshot "$vm" take 0
    done
}

termcheck() {
    echo -e "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m"
    echo -e "\e[3mitalics\e[23m"
    echo -e "\e[1mbold\e[0m"
    echo -e "\e[4munderline\e[0m"
    echo -e "\e[9mstrikethrough\e[0m"
    echo -e "\e[31mHello World\e[0m"
}
# -]

#       Text [-
#       ----

md2html() {
    local IFS=+
    local format=(
        markdown_github
        footnotes
        fenced_code_attributes
        pandoc_title_block
        shortcut_reference_links
    )
    local pandoc_options=(
        -f "${format[*]}"
        -s                                  # produce output with header and footer
        -S                                  # produce typographically correct output
        --toc                               # table of contents
        -c $HOME/.pandoc/css/pandoc.css     # path to custom css styles
    )
    pandoc "${pandoc_options[@]}" "$@"
}

md2pdf() {
    local IFS=+
    local format=(
        markdown_github
        footnotes
        fenced_code_attributes
        pandoc_title_block
        shortcut_reference_links
    )
    pandoc \
        -f "${format[*]}" \
        -V fontsize=12pt \
        -V mainfont="TakaoMincho" \
        --latex-engine=xelatex \
        -S \
        --toc \
        "$@"
}
# -]
