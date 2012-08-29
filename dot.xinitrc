export LANG=ja_JP.UTF-8

xrdb -merge "${HOME}/.Xresources"
setxkbmap -layout jp -option ctrl:nocaps -option terminate:ctrl_alt_bksp
convert "${HOME}/wallpapers/$(hostname -s ).jpg" -adaptive-resize $(xwininfo -root | grep geometry | awk '{ print $2 }') - | xloadimage -center -onroot stdin
xset s off -dpms

mlterm &
exec fawm

# vim: tabstop=2 shiftwidth=2 expandtab softtabstop=2 filetype=sh
