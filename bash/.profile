## === if running bash
if [ -n "$BASH_VERSION" ] && [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

## === adding custom folders to $PATH
#PATH="$PATH:$HOME/.local/pyvenv/bin:$HOME/.gem/ruby/2.3.0/bin"
# PATH="$PATH/:$HOME/bin/"


# environment variable for qt5 theming in Arch linux
export QT_QPA_PLATFORMTHEME=qt5ct


## === automatic startx on arch
# [[ -z "$DISPLAY" && "$(fgconsole)" -eq 1 ]] && exec startx

#path_prepend() {
#    for arg in "$@"; do
#        if [[ ":${PATH}:" != *":${arg}:"* ]]; then
#            export PATH="${arg}${PATH:+":$PATH"}"
#        fi
#    done
#}
#
#path_append() {
#    for arg in "$@"; do
#        if [[ ":${PATH}:" != *":${arg}:"* ]]; then
#            export PATH="${PATH:+"$PATH:"}${arg}"
#        fi
#    done
#}

#path_append "custom folder1" "custom folder2"
