#!/bin/bash

STATUS=$( playerctl status 2>&1 )

if [ "$STATUS" == "Playing"  ]
then
	echo ""
else
	echo ""
fi
