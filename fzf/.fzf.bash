# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mire/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/mire/.fzf/bin"
fi

eval "$(fzf --bash)"
