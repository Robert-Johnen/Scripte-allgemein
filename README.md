# kurze Scripte

- getMS-InstKey (Bash-Script) - reading MS-installation-key from ACPI-table of UEFI/BIOS this needs root-privileges (for that sudo in Script).  

- kbdremap.sh (Shell-Script) - had a refurbished-Computer with wrong keyboard (no < and > keys also no | Pipe. I redefined the keyboard systemwide to use CAPS-LOCK und SHIFT-CAPS-LOCK for < and >, SHIFT-SPACE for | Pipe. 
best located in /usr/local/bin and best startet at boot-time with kdbremap.service.

- kbdremap.service - starting Script _kbdremap.sh_ as System-Service (systemctl) at boot-time. After start all Terminals and X will used redefined keys

- prompt.sh - for a better feeeling at CLI:  
  --> Function *_colorCodesPrompt*:    
    `# exporting Variables to enable colors at CLI`  
    
  --> Function *_myPSx [01234]*:  
    `# Changes Prompt to my needs, Standard is colored: " $? ssh:user@host:~ $> "`  
  
- chpath.sh - adding and deleting parts of $PATH:  
  --> Function *_add2Path /directory*:  
    `# adds /directory to $PATH of user if not in use already`  
    
  --> Function *_rmPath /directory*:  
    `# removes /directory from $PATH of user`  
    
- file2clipboard.sh - file (non-binary) or filename to clipboard (of Display-Server):  
  --> Funktion *_f2clb /dir/file [01]*:  
    `# moves file to X-clipboard (2. Parameter: 0 or empty , with intro and ending (Standard), 1 without) needed by function _dc and also usable with Wayland.`
    
- docommand.sh - executes command and moves output to stdout and clipboard:  
  --> Function *_dc "command"*:  
    `# evaluates 'command', with shared output on stdout and into file /tmp/_dc.${USER}. file will be copiedto X-clipboard.`  
  
  - ssubexecs.sh - searches substring in all aliases, functions and executables in $PATH:  
  --> Function *_sucheSub String*:
    `# searching "String" in every alias, every loaded function and all executable files in $PATH. Results on stdout.`  
       
       
