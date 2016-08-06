# if running bash
if [ -n "$BASH_VERSION" ] && [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

PATH="$PATH:$HOME/.local/pyvenv/bin:$HOME/.gem/ruby/2.3.0/bin"


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
