# # The following lines were added by compinstall
# zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
# zstyle ':completion:*' matcher-list ''
# zstyle ':completion:*' max-errors 2
# zstyle ':completion:*' prompt '*'
# zstyle :compinstall filename '$HOME/.zshrc'
# # git completion
# zstyle ':completion:*:*:git:*' script ~/.shell_config/zsh/git/git-completion.zsh
# fpath=(~/.shell_config/zsh $fpath)
# autoload -Uz compinit
# compinit
# # set change directory without cd and notification for background jobs
# setopt autocd notify
# # Setting vi mode for zsh
# bindkey -v
# # remplazo de shopt para bash
# setopt kshglob
# # eliminar no match message
# unsetopt nomatch

# # Setting prompt
# source ~/.prompt/prompt-dracula.sh

# # fzf config
# # shellcheck disable=SC1090
# if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
#   export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
# fi
# # Auto-completion
# # shellcheck disable=SC1090
# [[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null
# # Key bindings
# # shellcheck disable=SC1090
# source "$HOME/.fzf/shell/key-bindings.zsh"
# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_OPTS='--height 96% --reverse --preview "cat {}"'

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/bin/terraform terraform
# # Calling config files
# # shellcheck disable=1090
# for f in "$HOME/.shell_config/myalias/*";
# do
#    if [ -f "$f" ]
#    then
#        source "$f";
#    fi
# done

# # Exporting personalized commands to path
# export PATH="$HOME/shell_config/commands:$PATH"
source ~/.shel_config/zsh/zshrc
