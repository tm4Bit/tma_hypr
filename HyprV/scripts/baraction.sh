#!/bin/sh
. ~/.config/HyprV/hyprv.conf

# Set the waybar theme
ln -sf ~/.config/HyprV/waybar/style/style.css ~/.config/waybar/style.css
ln -sf ~/.config/HyprV/waybar/conf/config.jsonc ~/.config/waybar/config.jsonc

# Set the wofi theme
ln -sf ~/.config/HyprV/wofi/style/style.css ~/.config/wofi/style.css
ln -sf ~/.config/HyprV/wofi/config ~/.config/wofi/config

# Set the mako theme
ln -sf ~/.config/HyprV/mako/conf/config ~/.config/mako/config

# Set the wlogout config and theme
ln -sf ~/.config/HyprV/wlogout/layout ~/.config/wlogout/layout
ln -sf ~/.config/HyprV/wlogout/style.css ~/.config/wlogout/style.css
ln -sf ~/.config/HyprV/wlogout/icons/ ~/.config/wlogout/icons/

# Set icon theme
xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"

# Set GTK theme
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"

# Initialize wallpaper
swww img $SET_BG --transition-fps 60 --transition-type wipe --transition-duration 2

#reset mako
sleep 1
pkill mako
mako &

#restart the waybar
#killall -SIGUSR2 waybar <-- start causing web brwsers to close so switched to below...
pkill waybar
waybar &
