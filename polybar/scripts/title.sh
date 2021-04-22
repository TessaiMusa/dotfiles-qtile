#!/bin/bash

DATA=$( playerctl metadata --format {{title}} 2>&1 )

if [ "$DATA" == "No players found" ]
then
	echo "None"
else
	echo $DATA
fi
