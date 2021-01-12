#!/bin/fish

set tmp_dir '/tmp/eww/cover'

if test -d $tmp_dir
else
    mkdir -p $tmp_dir
end

if test (playerctl metadata --format {{mpris:artUrl}}) 
    curl -s (playerctl metadata --format {{mpris:artUrl}}) --output $tmp_dir/cover.png
end