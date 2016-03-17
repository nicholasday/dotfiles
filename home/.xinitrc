xrdb -merge ~/.config/colors/base16-monokai.dark.256.xresources
xrdb -merge ~/.Xresources
xmodmap -e "keycode 135 = Super_L NoSymbol Super_L"
redshift -l 36.08:-79.8194 -m randr -v &
wicd-gtk --tray &
udiskie &
urxvt &
firefox &
exec i3
