#!/bin/sh

#hsetroot -solid '#000000'
feh --bg-scale ~/.config/wall.jpg
picom -CGb --config ~/.config/picom/picom.conf

export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

xbacklight -set 10.0
remaps &
unclutter &
#~/.scripts/dwm_status &
slstatus &
exec dwm
