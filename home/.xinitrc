#!/bin/bash

export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D

#hsetroot -solid '#000000'
feh --bg-scale ~/wallpapers/wall_3.jpg
picom -CGb --config ~/.config/picom/picom.conf

xbacklight -set 70.0
remaps &
xrdb ~/.Xresources
dwm_status &
exec dwm
