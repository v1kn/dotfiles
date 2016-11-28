CopyFile /etc/systemd/system/screenlock.service
CopyFile /etc/systemd/system/powertop.service

CreateLink /etc/systemd/system/dbus-org.freedesktop.NetworkManager.service /usr/lib/systemd/system/NetworkManager.service
CreateLink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service /usr/lib/systemd/system/NetworkManager-dispatcher.service
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
CreateLink /etc/systemd/system/multi-user.target.wants/NetworkManager.service /usr/lib/systemd/system/NetworkManager.service
CreateLink /etc/systemd/system/multi-user.target.wants/dhcpcd.service /usr/lib/systemd/system/dhcpcd.service
CreateLink /etc/systemd/system/multi-user.target.wants/haveged.service /usr/lib/systemd/system/haveged.service
CreateLink /etc/systemd/system/multi-user.target.wants/remote-fs.target /usr/lib/systemd/system/remote-fs.target
CreateLink /etc/systemd/system/multi-user.target.wants/tlp.service /usr/lib/systemd/system/tlp.service
CreateLink /etc/systemd/system/multi-user.target.wants/ufw.service /usr/lib/systemd/system/ufw.service
CreateLink /etc/systemd/system/sleep.target.wants/screenlock.service /etc/systemd/system/screenlock.service
CreateLink /etc/systemd/system/suspend.target.wants/screenlock.service /etc/systemd/system/screenlock.service
CreateLink /etc/systemd/user/default.target.wants/xdg-user-dirs-update.service /usr/lib/systemd/user/xdg-user-dirs-update.service
CreateLink /etc/systemd/user/sockets.target.wants/pulseaudio.socket /usr/lib/systemd/user/pulseaudio.socket
CreateLink /etc/systemd/system/multi-user.target.wants/powertop.service /etc/systemd/system/powertop.service
CreateLink /etc/systemd/system/multi-user.target.wants/ntpd.service /usr/lib/systemd/system/ntpd.service

