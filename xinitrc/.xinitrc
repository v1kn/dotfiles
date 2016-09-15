# ==config==

export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

xset dpms 0 0 300
setxkbamp -option ctrl:nocaps

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# ==autostart==

caffeine &
dunst &
fcitx &
redshift
xautolock -time 5 -locker "i3lock -f -e -c 232323" -notify 30 -notifier "notify-send -u critical 'LOCKING screen in 30 seconds'" &


# ==start DE==

exec startxfce4
