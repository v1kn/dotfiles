# boot
IgnorePath '/boot'
IgnorePath '/boot/*'

# /var
IgnorePath '/var/lib'
IgnorePath '/var/db' # databases
IgnorePath '/var/log' # logs
IgnorePath '/var/spool' # spool
IgnorePath '/var/.updated' # systemd-update-done.service

# /etc
IgnorePath '/etc/dhcpcd.duid'
IgnorePath '/etc/machine-id'
IgnorePath '/etc/ld.so.cache' # "File containing an ordered list of libraries found in the directories specified in /etc/ld.so.conf
IgnorePath '/etc/udev/hwdb.bin' # https://www.freedesktop.org/software/systemd/man/hwdb.html
IgnorePath '/etc/.pwd.lock' # passwd; http://blog.dailystuff.nl/2011/08/the-hunt-for-etc-pwd-lock/
IgnorePath '/etc/group'
IgnorePath '/etc/group-'
IgnorePath '/etc/gshadow'
IgnorePath '/etc/gshadow-'
IgnorePath '/etc/passwd-'
IgnorePath '/etc/shadow'
IgnorePath '/etc/shadow-'
IgnorePath '/etc/ssh/*_key' # SSH Host private keys
IgnorePath '/etc/ssh/*_key.pub' # SSH Host public keys
IgnorePath '/etc/lvm/cache/.cache' # LVM cache
IgnorePath '/etc/xml/catalog' # http://xmlsoft.org/catalog.html
IgnorePath '/etc/gtk-2.0/gdk-pixbuf.loaders' # GTK
IgnorePath '/etc/pacman.d/gnupg' # pacman keyring
IgnorePath '/etc/ca-certificates/extracted' # certs
IgnorePath '/etc/ssl/certs' # certs Symlinks
IgnorePath '/etc/.updated' # systemd-update-done.service
IgnorePath '/etc/texmf'
IgnorePath '/etc/pacman.d/mirrorlist.pacnew'

## /usr/lib
IgnorePath '/usr/lib/graphviz'
IgnorePath '/usr/lib/libcryptopp*'
IgnorePath '/usr/lib/libstfl*'
IgnorePath '/usr/lib/locale/locale-archive' #locale
IgnorePath '/usr/lib/modules' # kernel modules
IgnorePath '/usr/lib/modules/*' # kernel modules
#GTK
IgnorePath '/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache'
IgnorePath '/usr/lib/gtk-2.0/2.10.0/immodules.cache'
IgnorePath '/usr/lib/gtk-3.0/3.0.0/immodules.cache'
#
IgnorePath '/usr/share/info/dir' #info
IgnorePath '/usr/share/mime/*' # MIME
IgnorePath '/usr/share/applications/mimeinfo.cache' #MIME
# python
IgnorePath '/usr/lib/python*'
IgnorePath '/usr/share/gcc-*/python/*/__pycache__/*.pyc'
IgnorePath '/usr/share/gdb/python/*/__pycache__/*.pyc'
# Desktop - Fonts
IgnorePath '/usr/share/fonts/misc/fonts.dir'
IgnorePath '/usr/share/fonts/misc/fonts.scale'
IgnorePath '/usr/share/fonts/OTF/fonts.dir'
IgnorePath '/usr/share/fonts/OTF/fonts.scale'
IgnorePath '/usr/share/fonts/TTF/fonts.dir'
IgnorePath '/usr/share/fonts/TTF/fonts.scale'
IgnorePath '/usr/lib/gio/modules/giomodule.cache' # gnome
IgnorePath '/usr/share/glib-2.0/schemas/gschemas.compiled' # gnome
IgnorePath '/usr/share/icons/*/icon-theme.cache' # icons cache
IgnorePath '/usr/share/texmf-dist'

# packages
IgnorePath '/usr/bin/virtualenv'
IgnorePath '/usr/bin/pacaur'
IgnorePackage --foreign devilspie2

# temporary changes
IgnorePath '/etc/fstab'
