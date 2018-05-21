xrdb -merge ~/.config/base16-xresources/xresources/base16-materia-256.Xresources
xrdb -merge ~/.Xresources
xrdb -merge ~/.Xresources-rofi
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
xmodmap -e "keycode 135 = Super_L NoSymbol Super_L"
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Enabled" 0
redshift -l 36.08:-79.8194 -m randr -v &
udiskie &
alacritty &
firefox &
xsetroot -solid "#263238"
exec i3
