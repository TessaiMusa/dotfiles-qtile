#!/bin/fish

set title=(playerctl metadata --format '{{ title }}')

if test $title == "No players found"
	echo "Nothing playing"
else
	echo $title
end
