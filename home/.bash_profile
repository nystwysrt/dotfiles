# Get the aliases and functions
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Load Nord dir colors
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

export TERM="screen-256color"
export T2SRC="/usr/src/t2-src"
export T2WRC="/usr/src/t2-wrc"
export DOTFILES="$HOME/dotfiles"
export SCRIPTS="$HOME/scripts"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export READER="zathura"
export ARDUINO="/$HOME/opt/arduino-ide_2.2.1" 
export SBIN="/sbin"
export USRSBIN="/usr/sbin"
export PATH="$PATH:$SCRIPTS:$ARDUINO:$SBIN:$USRSBIN"

# Auto start the X11 server if on tty1
#[[ -z "$DISPLAY" ]] && [[ "$(tty)" = /dev/tty1 ]] && startx
