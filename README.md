# kurze Scripte

- getMS-InstKey (Bash-Script) - reading MS-installation-key from ACPI-table of UEFI/BIOS this needs root-privileges (for that sudo in Script).  

- kbdremap.sh (Shell-Script) - had a refurbished-Computer with wrong keyboard (no < and > keys also no | Pipe. I redefined the keyboard systemwide to use CAPS-LOCK und SHIFT-CAPS-LOCK for < and >, SHIFT-SPACE for | Pipe. 
best located in /usr/local/bin and best startet at boot-time with kdbremap.service.

- kbdremap.service - starting Script _kbdremap.sh_ as System-Service (systemctl) at boot-time. After start all Terminals and X will used redefined keys
       
Weitere Scripte finden sich unter <https://github.com/Robert-Johnen/Joy-LHD>
