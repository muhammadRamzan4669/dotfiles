picom &

if xrandr | rg "HDMI-1 connected" > /dev/null; then
  xrandr --output HDMI-1 --mode 1920x1080 --rate 75 --above eDP-1
fi

xinput set-prop 12 "libinput Tapping Enabled" 1

exec dwm
