##!/bin/bash
## set vi mode for bash and vim as the default editor
#set -o vi
#export EDITOR='vim'

## check the window size after each command and, if necessary,
## update the values of LINES and COLUMNS.
#shopt -s checkwinsize

## If set, the pattern "**" used in a pathname expansion context will
## match all files and zero or more directories and subdirectories.
#shopt -s globstar

### Setting powerline daemon to improve speed
#powerline-daemon -q
## shellcheck disable=SC2034
#POWERLINE_BASH_CONTINUATION=1
## shellcheck disable=SC2034
#POWERLINE_BASH_SELECT=1

## Setting env for remote config
## shellcheck disable=SC2034
#cf=".juanito_rc"

## Make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

## Colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

## Setting tmux to launch always on gui only or on wsl
#if [[ $DISPLAY ]] || [[ "$(< /proc/sys/kernel/osrelease)" == *microsoft* ]]; then
#    # If not running interactively, do not do anything
#    # [[ $- != *i* ]] && return
#    [[ -z "$TMUX" ]] && exec tmux
#fi

## SSH for tmux test, still need to figure out how to return empty if no tmux found on remote
#function ssh (){
#    # This one liner do:
#    # - Checks if tmux is present
#    # - Checks if tmux conf is present in specified route
#    # - Attachs or connnects to tmux
#    # - If tmux is not present, starts a normal shell, and sends a goodbye message once you disconnect
## shellcheck disable=SC2034
## cf=".juanito_rc"
#       /usr/bin/ssh -t "$@" "if command -v tmux &>/dev/null; then if [ -f \$HOME/\"$cf\"/.tmux.conf ] &>/dev/null; then tmux -f \$HOME/\"$cf\"/.tmux.conf new -A -s $(whoami) &> /dev/null; else tmux new -A -s $(whoami); fi; else \$SHELL -l; echo "Fin de la sesión"; fi;"
#    }

##Enabling bash completion
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#      # shellcheck disable=SC1091
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#      # shellcheck disable=SC1091
#    . /etc/bash_completion
#  fi
#fi

## Enabling fzf for completion
## shellcheck disable=SC1090
#if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
#  export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
#fi
## Auto-completion
## shellcheck disable=SC1090
#[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.bash" 2> /dev/null
## Key bindings
## shellcheck disable=SC1090
#source "$HOME/.fzf/shell/key-bindings.bash"
#export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_DEFAULT_OPTS='--height 96% --reverse --preview "cat {}"'

## Enabling tmux completion
## shellcheck disable=SC1091 disable=1090
#source "$HOME"/.tmux/completion/completions/tmux

## Enabling prompt
## shellcheck disable=SC1091 disable=1090
#source "$HOME"/.prompt/prompt-gruvbox.sh

## Calling config files
## shellcheck disable=1090
#for f in "$HOME"/.shell_config/myalias/*;
#do
#   if [ -f "$f" ]
#   then
#       source "$f";
#   fi
#done

## Exporting personalized commands to path
#export PATH=~/.shell_config/commands:$PATH

## Terraform settings
#complete -C /usr/bin/terraform terraform
#export TF_LOG=TRACE
#export TF_LOG_PATH="terraform.txt"
source ~/.shell_config/bash/bashrc
