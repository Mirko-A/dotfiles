#!/bin/bash

print_usage() {
    cat <<EOF
NAME
    $(basename "$0") - create a tmux project startup script

SYNOPSIS
    $(basename "$0") PROJECT_PATH [PROJECT_NAME]
    $(basename "$0") --help | -h

DESCRIPTION
    Creates an executable PROJECT_NAME_tmux.sh script in the current directory.
    The generated script opens (or reuses) a tmux session named PROJECT_NAME
    and starts it in PROJECT_PATH, with Neovim in the first window.

REQUIRED ARGUMENTS
    PROJECT_PATH
        Full path to the project directory. The path must be absolute.

OPTIONAL ARGUMENTS
    PROJECT_NAME
        Name of the tmux session and generated startup script prefix.
        Defaults to the final directory name in PROJECT_PATH.

OPTIONS
    -h, --help
        Display this help message and exit.

EXAMPLES
    $(basename "$0") /home/mire/Documents/dev/work/main/my-project
    $(basename "$0") /home/mire/Documents/dev/work/main/my-project work
EOF
}

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    print_usage
    exit 0
fi

if [ "$#" -gt 2 ]; then
    echo "Error: too many arguments." >&2
    echo >&2
    print_usage >&2
    exit 1
fi

PROJECT_PATH="$1"

if [ -z "$PROJECT_PATH" ]; then
    echo "Error: PROJECT_PATH is required." >&2
    echo >&2
    print_usage >&2
    exit 1
fi

case "$PROJECT_PATH" in
/*) ;;
~*) ;;
*)
    echo "Error: PROJECT_PATH must be an absolute path." >&2
    echo >&2
    print_usage >&2
    exit 1
    ;;
esac

# Ignore trailing slashes when deriving the default project name.
PROJECT_NAME_PATH="$PROJECT_PATH"
while [ "${PROJECT_NAME_PATH%/}" != "$PROJECT_NAME_PATH" ]; do
    PROJECT_NAME_PATH="${PROJECT_NAME_PATH%/}"
done

PROJECT_NAME="${2:-${PROJECT_NAME_PATH##*/}}"

if [ -z "$PROJECT_NAME" ]; then
    echo "Error: could not derive PROJECT_NAME from PROJECT_PATH; provide it explicitly." >&2
    echo >&2
    print_usage >&2
    exit 1
fi

printf -v QUOTED_PROJECT_NAME '%q' "$PROJECT_NAME"
printf -v QUOTED_PROJECT_PATH '%q' "$PROJECT_PATH"

SCRIPT_CONTENT="#!/bin/bash

PROJECT_NAME=$QUOTED_PROJECT_NAME
PROJECT_PATH=$QUOTED_PROJECT_PATH

cd \"\$PROJECT_PATH\" || {
    echo \"Error: failed to navigate to \$PROJECT_PATH\"
    exit 1
}

tmux has-session -t=\"\$PROJECT_NAME\" 2>/dev/null
if [ \$? != 0 ]; then
    tmux new-session -d -s \"\$PROJECT_NAME\"
    tmux send-keys -t \"\$PROJECT_NAME:^\" 'nvim' Enter
    tmux new-window -t \"\$PROJECT_NAME\"
    tmux split-pane -h -t \"\$PROJECT_NAME\"
    tmux select-window -t \"\$PROJECT_NAME:^\"
fi

tmux attach-session -t \"\$PROJECT_NAME\"
"

SCRIPT_PATH="${PROJECT_NAME}_tmux.sh"
echo "Info: Creating Tmux startup script at $SCRIPT_PATH"
echo "$SCRIPT_CONTENT" >"$SCRIPT_PATH"
chmod +x "$SCRIPT_PATH"
echo "Info: Done"
