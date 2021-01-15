#!/bin/fish

set currentStatus (playerctl status)
if test $currentStatus = "Playing"
    echo ""
else if test $currentStatus = "Paused"
    echo ""
else
    echo ""
end