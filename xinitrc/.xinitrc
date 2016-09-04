# fcitx settings
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# keyboard settings
setxkbamp -option ctrl:nocaps

# autostart apps
dunst &
xautolock -time 20 -locker "i3lock -b -f -e -c 232323" -notify 30 -notifier "notify-send -u critical 'LOCKING screen in 30 seconds'" &
caffeine &
redshift &

# start DE
exec startxfce4
