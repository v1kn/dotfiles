#CopyFile /etc/fstab
CopyFile /etc/gconf/gconf.xml.defaults/%gconf-tree.xml
CopyFile /etc/gufw/Home.profile 600
CopyFile /etc/gufw/Office.profile 600
CopyFile /etc/gufw/Public.profile 600
CopyFile /etc/gufw/gufw.cfg 600
CopyFile /etc/hostname
CopyFile /etc/hosts
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen
CreateLink /etc/localtime /usr/share/zoneinfo/Europe/Warsaw
CopyFile /etc/modprobe.d/nobeep.conf
CreateLink /etc/os-release ../usr/lib/os-release
CopyFile /etc/pacman.conf
CopyFile /etc/pacman.d/mirrorlist
CopyFile /etc/pam.d/login
CopyFile /etc/pam.d/passwd
CopyFile /etc/pamac.conf
CopyFile /etc/passwd
CopyFile /etc/resolv.conf
CopyFile /etc/resolv.conf.bak
CopyFile /etc/sudoers 440
CopyFile /etc/systemd/logind.conf
CopyFile /etc/NetworkManager/system-connections/sadzo 600
CopyFile /etc/default/grub
CopyFile /etc/ufw/ufw.conf
CopyFile /etc/ufw/user.rules
CopyFile /etc/ufw/user6.rules
CopyFile /etc/vconsole.conf

# font symlinks
CreateLink /etc/fonts/conf.d/20-unhint-small-dejavu-sans-mono.conf ../conf.avail/20-unhint-small-dejavu-sans-mono.conf
CreateLink /etc/fonts/conf.d/20-unhint-small-dejavu-sans.conf ../conf.avail/20-unhint-small-dejavu-sans.conf
CreateLink /etc/fonts/conf.d/20-unhint-small-dejavu-serif.conf ../conf.avail/20-unhint-small-dejavu-serif.conf
CreateLink /etc/fonts/conf.d/57-dejavu-sans-mono.conf ../conf.avail/57-dejavu-sans-mono.conf
CreateLink /etc/fonts/conf.d/57-dejavu-sans.conf ../conf.avail/57-dejavu-sans.conf
CreateLink /etc/fonts/conf.d/57-dejavu-serif.conf ../conf.avail/57-dejavu-serif.conf
