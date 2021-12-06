#!/bin/bash

# mein Lenovo T440s hat keine Kleiner-Groesser--Pipe-Taste
# also definiere ich die CapsLock-Taste entsprechend um
# Diese Definition beim Systemstart gilt fuer virtuelle
# Terminals und X

# Caps_Lock = Kleiner als
# Shift+Caps_Lock = Groesser als

(dumpkeys | grep keymaps; echo "keycode 58 = less greater") | loadkeys -

# Shift+Space = Pipezeichen ( | )
(dumpkeys | grep keymaps; echo "keycode 57 = space bar Meta_space") | loadkeys -