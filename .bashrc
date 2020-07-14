#!/bin/bash
# set vi mode for bash
# bash_completion ]; then
#     . /etc/bash_completion
# fi
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Enabling fzf for completion
# shellcheck disable=SC1090
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 96% --reverse --preview "cat {}"'

# Calling config files
# shellcheck disable=1090
#for f in .shell_config/*; do source "$f"; done
for f in .shell_config/*;
do
    if [ -d "$f" ]
        then
            for g in "$f"/*; do source "$g"; done
        else
            source "$f";
    fi
done
