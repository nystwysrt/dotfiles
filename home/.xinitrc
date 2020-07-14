#!/bin/sh

xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap &&

xset r rate 300 50
picom -CGb --config ~/.config/picom/picom.conf
feh --bg-scale ~/.config/wall.jpg
#hsetroot -solid '#000000'

export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

unclutter &
~/.scripts/dwm_status &
exec dwm
