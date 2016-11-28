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
CopyFile /etc/lvm/archive/vd0_00000-548204122.vg 600
CopyFile /etc/lvm/archive/vd0_00001-957002667.vg 600
CopyFile /etc/lvm/archive/vd0_00002-1648279256.vg 600
CopyFile /etc/lvm/archive/vd0_00003-253339775.vg 600
CopyFile /etc/lvm/backup/vd0 600
CopyFile /etc/mkinitcpio.conf
CopyFile /etc/pacman.d/hooks/mirrorlist.hook
CopyFile /etc/pacman.d/hooks/paccache.hook
CopyFile /usr/local/bin/cclean 755
