# user specific
[ -d $HOME/bin ] && export PATH="$PATH:$HOME/bin"
[ -d $HOME/.local/bin ] && export PATH="$PATH:$HOME/.local/bin"

# package specific
[ -f $HOME/.cargo/env ] && . "$HOME/.cargo/env"

[ -d $HOME/go/bin ] && export PATH="$PATH:$HOME/go/bin"

[ -d $HOME/.foundry/bin ] && export PATH="$PATH:$HOME/.foundry/bin"

# secrets (untracked)
[ -f $HOME/.secrets ] && . "$HOME/.secrets"
