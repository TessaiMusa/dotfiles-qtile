#!/bin/bash

/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
~/.config/polybar/launch.sh
picom --experimental-backends &
fcitx &
