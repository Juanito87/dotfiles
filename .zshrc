# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' prompt '*'
zstyle :compinstall filename '/home/juanito/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
# HISTFILE=~/.histfile
# HISTSIZE=10000
# SAVEHIST=1000
setopt autocd notify
# Setting vi mode for zsh
bindkey -v
# End of lines configured by zsh-newuser-install
# remplazo de shopt para bash
setopt kshglob
# eliminar no match message
unsetopt nomatch
# Setting prompt
source ~/.prompt/prompt-dracula.sh
# source ~/.shell_config/alias

# Enabling fzf for completion
# shellcheck disable=SC1090
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 96% --reverse --preview "cat {}"'

# Calling config files
# shellcheck disable=1090
for f in "$HOME"/.shell_config/*;
do
    if [ -d "$f" ]
        then
            for g in "$f"/*; do source "$g"; done
        else
            source "$f";
    fi
done
