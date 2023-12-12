# Get the aliases and functions
[[ -f ~/.bashrc ]] && . ~/.bashrc

export TERM="screen-256color"
export DOTFILES="$HOME/dotfiles"
export SCRIPTS="$HOME/scripts"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export ARDUINO="/$HOME/opt/arduino-ide_2.2.1" 
export PATH="$PATH:$SCRIPTS:$ARDUINO"

#[[ -z "$DISPLAY" ]] && [[ "$(tty)" = /dev/tty1 ]] && startx
