[[ -f ~/.bashrc ]] && . ~/.bashrc

export TERM="screen-256color"
export DOTFILES="$HOME/dotfiles"
export SCRIPTS="$HOME/scripts"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export PATH="$PATH:$SCRIPTS"

[[ -z "$DISPLAY" ]] && [[ "$(tty)" = /dev/tty1 ]] && startx
