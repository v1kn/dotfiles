# if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        source $HOME/.bashrc
    fi
fi

PATH="$PATH:$HOME/.local/bin:$HOME/.gem/ruby/2.1.0/bin"
