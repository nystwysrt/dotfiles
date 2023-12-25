#!/bin/bash

#hsetroot -solid '#000000'
feh --bg-scale ~/wall.jpg
#picom -CGb --config ~/.config/picom/picom.conf

export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

#xbacklight -set 30.0
remaps &
~/scripts/dwm_status &
exec dwm
