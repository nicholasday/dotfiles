xrdb -merge ~/.config/colors/base16-monokai.dark.256.xresources
xrdb -merge ~/.Xresources
xmodmap -e "keycode 135 = Super_L NoSymbol Super_L"
wicd-gtk --tray &
udiskie &
urxvt &
firefox &
exec i3
