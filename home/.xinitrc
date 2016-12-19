xrdb -merge ~/.config/base16-xresources/xresources/base16-materia-256.Xresources
xrdb -merge ~/.Xresources
xrdb -merge ~/.Xresources-rofi
xmodmap -e "keycode 135 = Super_L NoSymbol Super_L"
redshift -l 36.08:-79.8194 -m randr -v &
nm-applet &
udiskie &
urxvt &
firefox &
exec i3
