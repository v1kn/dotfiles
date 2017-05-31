#   PREAMBLE [-
#   ========

#   If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#   export variables
export EDITOR='vim'
export VISUAL='vim'
export GEM_PATH=$HOME/.local/gem
export CARGO_HOME=$HOME/.local/cargo
export CHEATCOLORS=true
# Xubuntu desktop tweaks
export QT_AUTO_SCREEN_SCALE_FACTOR=0
#export QT_QPA_PLATFORMTHEME=qt5ct
#export GTK_OVERLAY_SCROLLING=0
#export CLUTTER_BACKEND=x11

#   fixing duplicated path in tmux
[[ -z $TMUX ]] && PATH="$PATH:$HOME/.local/bin"

#   replace Caps with Ctrl
setxkbmap -option ctrl:nocaps

#   make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#   enable programmable completion features
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
  elif [[ $git_status =~ "untracked files present" ]]; then
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
[[ -n "$SSH_CLIENT" ]] && PS1+="\[$Yellow\]("${SSH_CLIENT%% *}")"
PS1+="\[$Yellow\][\u@\h]"           # u: username; h: hostname
PS1+="\[$Cyan\] [\w]"               # w: basename of pwd
PS1+="\[\$(git_color)\]"            # colors git status
PS1+=" \$(git_branch)"              # prints current branch
PS1+="\n\[$Color_Off\]"
PS1+="\[$Cyan\] =>> \[$Color_Off\]"
export PS1

#   legacy backup
# PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\$ '

# -]
#   GENERAL MODS [-
#   ============

#   prevent file overwrite with > redirection ( use >| to force)
set -o noclobber

#   Perform file completion in a case insensitive fashion
bind "set completion-ignore-case off"

#   Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

#   Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous off"

#   Entering a directory name as a bare word will change into that directory
shopt -s autocd

#   Automatically correct off-by-one typing mistakes when changing directories
shopt -s cdspell

#   Correct off-by-one typing mistakes when tab-completing directories
shopt -s dirspell

#   Enable fancy globbing functions
shopt -s extglob

#   update window size after every command
shopt -s checkwinsize

#   If set, the pattern "**" used in a pathname expansion context will
#   match all files and zero or more directories and subdirectories.
shopt -s globstar

#   Don't try to complete on empty lines
shopt -s no_empty_cmd_completion

#   Globs won't consider case
shopt -s nocaseglob

#   Globs will consider hidden files, too
shopt -s dotglob

#   combine multiline commands in history
shopt -s cmdhist

#   append to the history file, don't overwrite it
shopt -s histappend

#   don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth:erasedups

#   for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=500000
HISTFILESIZE=100000

#   dont record some commands
export HISTIGNORE="ls:ll:history:cd"
#-]
#   ALIASES [-
#   =======

#   package management
alias upda='sudo pacman -Syu'
alias updaa='sudo pacman -Syyu'
alias updu='sudo apt update && sudo apt full-upgrade'

alias insa='sudo pacman -S'
alias insaa='pacaur -ayu'
alias insu='sudo apt install'

alias sera='pacman -Ss'
alias seraa='pacaur -a'
alias seru='apt search'

alias showa='pacman -Sii'
alias showu='aptitude show'

alias rmva='sudo pacman -Rns'
alias rmvaa='sudo pacman -Rns $(pacman -Qqdt)'
alias rmvu='sudo apt-get --purge remove'
alias rmvuu='sudo apt-get --purge autoremove'

alias depsa='pactree'
alias rdepsa='pactree -r'
alias rdepsu='apt-cache rdepends'
alias depsu='apt-cache depends'

#   trash
alias trl='trash-list'
alias tre='trash-empty'
alias trrm='trash-rm $1'
alias trrs='restore-trash'
alias trp='trash-put'

#   colors
alias ls='ls --color=auto -h --group-directories-first -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='colordiff'

#   vim
alias vir='vim $HOME/.vimrc'
alias vib='vim $HOME/.bashrc'
alias vilog='view -M "+call Tailf()" $1'
alias vfs='sudo vim /etc/fstab'
alias vimin='vim -u "$HOME"/.vim/vimrc-minimal'

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
alias io='cd $HOME/grep/vlkn.github.io'
alias cal='cal -3':
alias dfc='dfc -t -tmpfs'
alias netres='sudo systemctl restart NetworkManager'
#   twitch
alias arism='twitchm avoidingthepuddle'
alias arisb='twitchb avoidingthepuddle'
alias hobm='twitchm the_happy_hob'
alias hobb='twitchb the_happy_hob'
alias distort2m='twitchm distortion2'
alias distort2b='twitchb distortion2'
#   complex
alias pipes='$HOME/filez/linux/scripts-ref/pipsies.sh -p 2 -f 40 -R -r 5000'
alias pipesx='$HOME/filez/linux/scripts-ref/pipesx.sh -n 2 -t 0 -t 1 -R -r 5000'
alias flacsplit='shnsplit -f *.cue -t "%n-%t" -o flac *.flac'
alias pkeys='xmodmap -e "keycode 101 = ISO_Level3_Shift"'
alias lsblk='lsblk -o NAME,SIZE,FSTYPE,TYPE,LABEL,MOUNTPOINT,UUID'
alias subs='subdownloader -c -l en --rename-subs -V'
alias wfup='sudo nmcli c up id sadzo'
alias tvb='mpv --ytdl-format="22/Source/[height=720]/best" $1'
alias tvm='mpv --ytdl-format="18/Medium/medium/[height<=480]/best" $1'
#mpv --ytdl-format="bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]/best"
alias mpvtb='mpv --script-opts=osc-layout=topbar'
alias showio='cat /sys/block/sda/queue/scheduler'

#   systemd
alias lt='systemctl list-timers'
alias mlt='systemctl --user list-timers'
alias st='systemctl status'
alias mst='systemctl --user status'
alias jrn='journalctl -xe'
# -]
#   FUNCTIONS [-
#   =========

#   Audio [-
#   -----

#   check if flacs in subdirectories have album art embedded
checkpicflac() {
    while read -r track; do
        pic=$(metaflac --list --block-type=PICTURE "$track")
        [[ -z "$pic" ]] && echo ""$track" has no picture"
    done <<< $(find . -depth -type f -name "*.flac")
}

#   add a YEAR tag to flacs in all subdirectories
addyearflac() {
    while read -r track; do
        year=$(metaflac --show-tag=DATE "$track" | cut -d= -f 2)
        metaflac --set-tag="YEAR=$year" "$track"
    done <<< $(find . -depth -type f -name "*.flac")
}

#   check whether flacs in subdirectores have a YEAR tag
checkyearflac() {
    while read -r track; do
        year=$(metaflac --show-tag=YEAR "$track")
        [[ -z "$year" ]] && echo ""$track" has no YEAR tag"
    done <<< $(find . -depth -type f -name "*.flac")
}

#   playing current dir files with mpv playlist
PlayCurrentDir() {
    mpv --no-video --playlist <(find "$PWD" -type f -follow | sort)
}
alias pcd='PlayCurrentDir'

#   multi-folder spectrograms
spectro_flac() {
    find . -depth -type f -name "*.flac" -print0 \
        | sort -zn \
        | xargs -0 -I{} -n1 -P$(($(nproc) / 2)) \
        sh -c 'sox "{}" -n spectrogram -o "{}.png"
    echo processed "{}"'
}
#   as above but more powerful; arrays, parallel processes and proper output
spectro_mass() {
    local ext=(
        -name \*.wav
        -o -name \*.flac
        -o -name \*.ape
        -o -name \*.m4a
        -o -name \*.mp3
        -o -name \*.ogg
    )
    find . -depth -type f \( "${ext[@]}" \) -print0 \
        | sort -zn \
        | xargs -0 -I{} -n1 -P$(($(nproc) / 2)) \
        sh -c 'sox "{}" -n spectrogram -o "{}.png"; echo processed "{}"'
}
alias spc='spectro_mass'
alias spcf='spectro_flac'
# -]
#   Video [-
#   -----

twitchb() {
    streamlink \
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
    streamlink \
        --http-header Client-ID=jzkbprff40iqj646a697cyrvl0zt2m6 \
        --retry-open 8000 \
        --retry-streams 10 \
        --player-continuous-http \
        --player-passthrough hls \
        --hls-segment-threads 3 \
        --player "mpv" \
        https://twitch.tv/$1 360p
}

subs-mass() {
    ext=( -iname \*.mp4 -o -iname \*.avi -o -iname \*.mkv )
    find . -depth -type f \( "${ext[@]}" \) -print0 \
        | sort -zn \
        | xargs -0 -I{} -n1 -P$(($(nproc) / 2)) \
        sh -c 'subdownloader -c -l en --rename-subs -V "{}"; echo processed "{}"'
}
# -]
#   Japanese [-
#   --------

#   list on'yomi of a kanji, using kanjidic
dicon() {
    perl -CSAD -e '$r=join q(|),grep /\p{cjk}/,split//,qq(@ARGV)||qx(xclip -o);$r||die qq(nothing given\n);open$f,q(<),qq($ENV{HOME}/.filez/dic/kanjidicx.utf8);while(<$f>){if(/^($r)/){$k=$1;($o)=/\s(\p{kana}+(\s\p{kana}+)*)\s/;print qq($k: $o\n)}}' "$@"
}
# -]
#   Package management [-
#   ------------------

#   removing build dependencies installed with apt-get build-dep
deprem() {
    sudo aptitude markauto \
        $(apt-cache showsrc $1 \
        | grep Build-Depends \
        | perl -p -e 's/(?:[\[(].+?[\])]|Build-Depends:|,|\|)//g')
}

#   showing installed headers and kernels
#   to uninstall these headers, pipe it through to "| xargs dpkg -r"
showheader() {
    while read k; do
        v=$(echo "$k" | cut -d- -f4 | cut -d' ' -f1)
        [ ! -z "$v" ] \
            && [ "$v" -le $(uname -r | cut -d- -f 2) ] \
            && echo $k | cut -d' ' -f2
    done <<< $(dpkg-query -l linux-header* | grep 'ii ')
}
showkernel() {
    dpkg-query -l linux-image* | grep 'ii ' | fgrep '4.' | awk '{print $2}'
}

#   list all PPAs installed
listppa() {
    grep -RoPish '(?<=ppa.launchpad.net/)[^/]+/[^/ ]+' /etc/apt | sort -u
}

#   check if PPAs are compatible with this ubuntu version
checkppa() {
    dist=$1
    ppas=$(grep -RoPish '(?<=ppa.launchpad.net/)[^/]+/[^/ ]+' /etc/apt | sort -u)
    while read -r ppa; do
        url="http://ppa.launchpad.net/$ppa/ubuntu/dists/$dist/"
        if [[ $(wget -O /dev/null "$url" 2>&1|grep "200 OK"|wc -l) == "0" ]]
        then
            echo -e "$ppa:\t\t\tNOPE, REMOVE IT!"
        else
            echo -e "$ppa:\t\t\tOK!"
        fi
    done <<< "$ppas"
}
# -]
#   git stuff [-
#   ---------

#   .gitignore file generation
gi() {
    curl -L -s https://www.gitignore.io/api/"$@" ;
}

#   create git repo folder with basic files inside
mkrep() {
    mkdir -p $HOME/grepo/"$@"
    cd $HOME/grepo/"$1"
    touch README.md
    cp $HOME/grepo/dotfiles/LICENSE.md .
    gi linux,vim > .gitignore
}
#   git fetch for multiple repos
gfall() {
    ls | xargs -I{} -n1 -P$(nproc) git -C {} fetch
}
#   git pull for multiple repos
gpall() {
    ls | xargs -i{} -n1 -P$(nproc) git -C {} pull
}
# -]
#   Filesystem [-
#   ----------

#   create directory and cd into it
mkd() {
    mkdir -p "$@" && cd "$@"
}

#   count lines in files, omitting newlines and/or comments
CountLines_NoNewline() {
    grep -cve '^\s*$' $1
}
CountLines_NoNewline_NoHashComment() {
    sed '/^\s*#/d;/^\s*$/d' $1 | wc -l
}
alias clin='CountLines_NoNewline'
alias clinc='CountLines_NoNewline_NoHashComment'

# show file creation time
# source: https://gist.github.com/moiseevigor/8c496f632137605b322e
xstat() {
    for target in "${@}"; do
        inode=$(ls -di "${target}" | cut -d ' ' -f 1)
        fs=$(df "${target}"  | tail -1 | awk '{print $1}')
        crtime=$(sudo debugfs -R 'stat <'"${inode}"'>' "${fs}" 2>/dev/null |
        grep -oP 'crtime.*--\s*\K.*')
        printf "%s\t%s\n" "${crtime}" "${target}"
    done
}

refile() {
    rename 's/ +\././; y/A-Z /a-z_/' "$@"
}
# -]
#   Web [-
#   ---

#   getting geolocation info from google maps api
geoloc() {
    wget -O- -q https://maps.googleapis.com/maps/api/geocode/json?address=$1
}
#   get weather on the commandline
wttr() {
    curl -k "https://wttr.in/$1"
}
#   tny urls
tny() {
    echo $(wget -qO- \
        http://tny.im/yourls-api.php?action=shorturl\&format=simple\&url=$1)
}
untny() {
    echo $(wget -qO- \
        http://tny.im/yourls-api.php?action=expand\&format=simple\&shorturl=$1)
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

#   adding all virtual machines to virtualbox at once
#   usage: vbox_add <path to root of /virt/vm>
vbox_add() {
    curvm=$(VBoxManage list vms | cut -d\" -f2 | wc -l)
    if [[ $curvm != 0 ]]; then
        while read vm; do
            VBoxManage unregistervm "$vm"
        done <<< $(VBoxManage list vms | cut -d\" -f2)
    fi
    while read vm2; do
        VBoxManage registervm "$vm2"
    done <<< $(find ""$1"/virt/vm" -depth -type f -name "*.vbox")
}

top10() {
    history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10
}

vbox_snapvm() {
    while read vm; do
        VBoxManage snapshot "$vm" delete 0
        VBoxManage snapshot "$vm" take 0
    done <<< $(VBoxManage list vms | cut -d\" -f2)
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
        markdown
        ascii_identifiers
        auto_identifiers
        autolink_bare_uris
        backtick_code_blocks
        blank_before_header
        emoji
        escaped_line_breaks
        fenced_code_attributes
        fenced_code_blocks
        footnotes
        implicit_header_references
        intraword_underscores
        link_attributes
        pipe_tables
        raw_html
        raw_tex
        shortcut_reference_links
        strikeout
        subscript
        superscript
        tex_math_dollars
        yaml_metadata_block
    )
    local pandoc_options=(
        -f "${format[*]}"
        --standalone                # -s produce output with header and footer
        --smart                     # -S produce typographically correct output
        --toc                       # table of contents
        --mathml                    # displaying math enclosed in `$`
    )
    pandoc "${pandoc_options[@]}" "$@"
}

md2pdf() {
    local IFS=+
    local format=(
        markdown
        ascii_identifiers
        auto_identifiers
        autolink_bare_uris
        backtick_code_blocks
        blank_before_header
        emoji
        escaped_line_breaks
        fenced_code_attributes
        fenced_code_blocks
        footnotes
        implicit_figures
        implicit_header_references
        intraword_underscores
        link_attributes
        pipe_tables
        raw_html
        raw_tex
        shortcut_reference_links
        strikeout
        subscript
        superscript
        tex_math_dollars
        yaml_metadata_block
    )
    pandoc \
        -f "${format[*]}" \
        -V fontsize=12pt \
        -V mainfont="Noto Sans" \
        -V urlcolor="cyan" \
        -V CJKmainfont="TakaoMincho" \
        --latex-engine=xelatex \
        -S \
        --toc \
        "$@"
}
# -]
