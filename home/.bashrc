#!/bin/bash

PS1='\u@\h:\w >\[\033[0;32m\]>\[\033[1;32m\]>\[\033[m\] '
stty -ixon # Disable ctrl-s and ctrl-q.
HISTSIZE= HISTFILESIZE= # Infinite history.

### aliases
alias t2wrc="cd /usr/src/t2-wrc"
alias t2src="cd /usr/src/t2-src"
alias :s="sudo"
alias ka="killall"
alias mkd="mkdir -pv"
alias :q="exit"
alias :c="clear"
alias smi="sudo make install"
alias chmox="chmod +x"
alias batt="acpi -b"
alias wpa="sudo wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant.conf"
alias lynx="exec lynx.sh"
alias ?="duck"
alias ??="google"
alias swayrc="nvim ~/.config/sway/config"

# Git
alias ga="git add"
alias gs="git status"
alias gc="git commit -m"
alias gpush="git push"
alias gpull="git pull"

# Projects dir
alias dm2="cd ~/projects/dm2"
alias dm3="cd ~/projects/dm3"

# Faster cd to directory
alias dot="cd $DOTFILES"
alias scripts="cd $SCRIPTS"
alias repos="cd ~/Repos"

# XBPS
alias xi='sudo xbps-install'
alias xr='sudo xbps-remove'
alias xq='sudo xbps-query -Rs'

alias libopencm3-template="git clone --recurse-submodules https://github.com/libopencm3/libopencm3-template.git"

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -alh --group-directories-first --color=always'
alias la='ls -a'
alias l.="ls -A | egrep '^\.'"
alias free="free -h"
alias tree="tree -a"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.

alias df='df -h'
alias rmrf='rm -rf'
alias ..='cd ..'
alias cd..="cd .."
alias nvimrc='nvim ~/.config/nvim/init.lua'
alias bashrc='nvim ~/.bashrc ; source ~/.bashrc'
alias bashprofilerc='nvim ~/.bash_profile ; source ~/.bash_profile'
alias xinitrc='nvim ~/.xinitrc'
alias tmuxrc='nvim ~/.config/tmux/tmux.conf'
alias free="free -mt"
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

#shopt
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases

#youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias yta-playlist="youtube-dl -i -f mp4 -o '%(playlist_index)s. %(title)s.%(ext)s'"
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

#shutdown or reboot

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
