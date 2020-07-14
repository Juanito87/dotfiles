# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ubuntu/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/ubuntu/.fzf/bin"
fi

# Auto-completion
# ---------------
# shellcheck disable=SC1091
[[ $- == *i* ]] && source "/home/ubuntu/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
# shellcheck disable=SC1091
source "/home/ubuntu/.fzf/shell/key-bindings.bash"
