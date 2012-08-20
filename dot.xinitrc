export LANG=ja_JP.UTF-8

xrdb -merge "${HOME}/.Xresources"
setxkbmap -option ctrl:nocaps -option terminate:ctrl_alt_bksp
xloadimage -center -onroot "${HOME}/wallpapers/$(hostname -s).jpg"

cd "${HOME}"
exec uwm --log-file="${HOME}/uwm.log" mlterm

# vim: tabstop=2 shiftwidth=2 expandtab softtabstop=2 filetype=sh
