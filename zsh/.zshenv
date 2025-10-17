
[ -d $HOME/bin ] && export PATH="$PATH:$HOME/bin"
[ -d $HOME/.local/bin ] && export PATH="$PATH:$HOME/.local/bin"
[ -d $HOME/.cargo/bin ] && export PATH="$PATH:$HOME/.cargo/bin"

[ -d $HOME/.foundry/bin ] && export PATH="$PATH:$HOME/.foundry/bin"

. "$HOME/.cargo/env"
