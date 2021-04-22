#!/bin/python

from libqtile.command.client import InteractiveCommandClient

c = InteractiveCommandClient().layout.info()['name']
if c == 'max':
    print('MONO')
elif c == 'bsp':
    print('BSPM')
elif c == 'monadtall':
    print('TALL')
elif c == 'zoomy':
    print('ZOOM')
else:
    print(c.upper())
