#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi


## start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


## config
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

xset dpms 360 600 720
setxkbamp -layout jp -option ctrl:nocaps

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK


## autostart
~/bin/watchdir.sh &
#caffeine &
dunst &
fcitx &
kalu &
#systemctl --user start kalud &> ~/sc-start.log
redshift
#$HOME/lemonbar-sample.sh | lemonbar -p -F "#000000" -B "#F23F23" -g "1000x16+180+0" -b &
#xautolock -time 5 -locker "i3lock -f -e -c 232323" -notify 30 -notifier "notify-send -u critical 'LOCKING screen in 30 seconds'" &
xautolock -time 5 -locker "$HOME/bin/lock" &


#==start X session==
#exec startxfce4

session=${1:-xfce}

case $session in
    xfce|xfce4 ) exec startxfce4;;
    i3|i3wm   ) exec i3;;
    mate ) exec mate-session;;
    *) exec $1;;
esac

