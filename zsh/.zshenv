# user specific
[ -d $HOME/bin ] && export PATH="$PATH:$HOME/bin"
[ -d $HOME/.local/bin ] && export PATH="$PATH:$HOME/.local/bin"

# package specific
[ -d $HOME/.cargo/bin ] && export PATH="$PATH:$HOME/.cargo/bin"

[ -d $HOME/.foundry/bin ] && export PATH="$PATH:$HOME/.foundry/bin"

[ -d $HOME/go/bin ] && export PATH="$PATH:$HOME/go/bin"

. "$HOME/.cargo/env"
